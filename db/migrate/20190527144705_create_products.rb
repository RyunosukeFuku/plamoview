class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.text :name, null: false, unique:true
      t.text :description, null: false
      t.integer :like_count
      t.integer :category_id
      t.integer :user_id
      t.timestamps
    end
  end
end
