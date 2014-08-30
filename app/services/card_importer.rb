class CardImporter
  CardJsonPath = Rails.root.join("public", "all_cards.json")

  EnumeratedFields = %w( card_type faction player_class race rarity )

  def initialize(json_path=CardJsonPath)
    @json = JSON.parse(File.read(CardJsonPath.to_s))
  end

  def list(key)
    @results = []
    @json.each do |_, cards|
      cards.each do |card|
        next unless card["collectible"]
        @results << card[key]
      end
    end
    @results.uniq
  end

  def import_mechanics
    @mechanics = []
    @json.each do |set_name, set|
      set.each do |card|
        mechanics = card["mechanics"]
        next if mechanics.blank?
        mechanics.each {|mechanic| @mechanics << mechanic }
      end
    end
    @mechanics.uniq.sort.each do |mechanic|
      Mechanic.new(name: mechanic).save
    end
  end

  def import_cards
    @json.each do |_, cards|
      cards.each do |card_data|
        next unless card_data["collectible"]
        card = Card.find_by(hearthstone_id: card_data["id"]) || Card.new
        card_data.keys.each do |json_key|
          rails_key = json_key.underscore
          rails_key = "hearthstone_id" if rails_key == "id"
          rails_key = "card_type" if rails_key == "type"
          rails_key = "mechanic_ids" if rails_key == "mechanics"
          next unless card.respond_to?(rails_key)
          if rails_key == "mechanic_ids"
            mechanic_ids = Mechanic.where(name: card_data["mechanics"]).pluck(:id)
            card.mechanic_ids = mechanic_ids
          elsif EnumeratedFields.include?(rails_key)
            card.send("#{rails_key}=", card_data[json_key].gsub(" ", "").underscore.to_sym)
          else
            card.send("#{rails_key}=", card_data[json_key])
          end
        end
        puts card.name
        card.save!
      end
    end
  end
end
