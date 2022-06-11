class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :drink_id
      t.integer :user_id
      t.string :image_id
      t.float :rating
      t.string :title
      t.text :impression
      t.timestamps
    end
  end
end
