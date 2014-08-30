class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :name
      t.integer :cost
      t.integer :type
      t.integer :rarity
      t.integer :faction
      t.integer :race
      t.integer :player_class
      t.text    :text
      t.string  :mechanic_ids, array: true, default: []
      t.integer :attack
      t.integer :health
      t.integer :durability
      t.string  :hearthstone_id
      t.boolean :collectible
      t.boolean :elite

      t.timestamps
    end
  end
end
