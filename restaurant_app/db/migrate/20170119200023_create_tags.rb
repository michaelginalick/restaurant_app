class CreateTags < ActiveRecord::Migration[5.0]
  def change
    create_table :tags do |t|
      t.string  :name
      t.integer :menu_item_id

      t.timestamps
    end
  end
end
