class AddAuthorIdToArticles < ActiveRecord::Migration
  def self.up
    add_column :articles, :author_id, :integer
    add_column :comments, :author_id, :integer
  end

  def self.down
    remove_column :articles, :author_id
    remove_column :comments, :author_id
  end
end
