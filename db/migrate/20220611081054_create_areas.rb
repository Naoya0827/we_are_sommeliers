class CreateAreas < ActiveRecord::Migration[6.1]
  def change
    create_table :areas do |t|

      t.timestamps
      t.string :name
    end
  end
end
