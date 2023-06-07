class FixAuthorIdToUseNamingCoventions < ActiveRecord::Migration[7.0]
  def change
    rename_column :likes, :user_id, :author_id
    rename_column :comments, :AuthorId, :author_id
    rename_column :posts, :AuthorId, :author_id
  end
end
