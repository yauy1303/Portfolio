class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.integer :member_id
      t.integer :article_id
      t.string :article_comment, null: false

      t.timestamps
    end
  end
end
