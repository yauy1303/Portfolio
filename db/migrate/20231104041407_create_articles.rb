class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.integer :user_id
      t.string :title
      t.string :text

      t.timestamps
    end
  end
end
