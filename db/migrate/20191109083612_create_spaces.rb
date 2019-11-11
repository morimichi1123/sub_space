class CreateSpaces < ActiveRecord::Migration[5.1]
  def change
    create_table :spaces do |t|
      t.string :space_name
      t.string :ward_id
      t.string :price

      t.timestamps
    end
  end
end
