class CreateMechanics < ActiveRecord::Migration
  def change
    create_table :mechanics do |t|
      t.string :name, unique: true

      t.timestamps
    end
  end
end
