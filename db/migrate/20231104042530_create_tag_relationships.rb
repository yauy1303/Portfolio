class CreateTagRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :tag_relationships do |t|
      t.integer :article_id, foreign_key: true
      t.integer :tag_id, foreign_key: true

      t.timestamps
    end

    add_index :tag_relationships, [:article_id, :tag_id], unique: true
  end
end
