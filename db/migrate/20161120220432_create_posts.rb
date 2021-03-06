class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.belongs_to :user, foreign_key: true, index: true
      t.timestamps
    end
  end
end
