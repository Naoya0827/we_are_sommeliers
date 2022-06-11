class CreateDrinks < ActiveRecord::Migration[6.1]
  def change
    create_table :drinks do |t|
      t.integer :genre_id
      t.integer :creator_id
      t.string :name
      t.string :alcohol
      t.text :introduction
      t.timestamps
    end
  end
end
