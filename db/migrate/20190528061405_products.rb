class Products < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
    t.string :name, unique:true, null: false
    t.text :description, null: false
    t.references :user 
    t.references :category
    t.integer :likes_count, default: 0
    t.timestamps
    end
  end
end
