class CreateMenuItems < ActiveRecord::Migration[5.0]
  def change
    create_table :menu_items do |t|

      t.string   :name
      t.string   :description
      t.string   :category
      t.integer  :restaurant_id

      t.timestamps
    end
  end
end