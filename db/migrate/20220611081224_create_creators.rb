class CreateCreators < ActiveRecord::Migration[6.1]
  def change
    create_table :creators do |t|
      t.integer :area_id
      t.string :name
      t.text :introduction
      t.timestamps
    end
  end
end
