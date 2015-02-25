class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :item_type
      t.string :title, null: false
      t.string :image_url, default: ''
      t.date :completed_on, default: nil
      t.timestamps null: false
    end
  end
end
