class CreateFavoriteDrinks < ActiveRecord::Migration[6.1]
  def change
    create_table :favorite_drinks do |t|
      t.integer :user_id
      t.integer :drink_id

      t.timestamps
    end
  end
end
