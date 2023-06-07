class ChangeCommentUserIdToAuthorId < ActiveRecord::Migration[7.0]
  def change
    rename_column :comments, :user_id, :AuthorId
    remove_column :comments, :UserId, :integer
    remove_column :comments, :PostId, :integer
  end
end
