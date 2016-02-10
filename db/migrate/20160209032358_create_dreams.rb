class CreateDreams < ActiveRecord::Migration
  def change
    create_table :dreams do |t|
      t.text :content
      t.integer :likes_count, default: 0
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :dreams, :users
  end
end
