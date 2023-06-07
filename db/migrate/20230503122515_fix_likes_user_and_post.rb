class FixLikesUserAndPost < ActiveRecord::Migration[7.0]
  def change
    remove_column :likes, :UserId, :integer
    remove_column :likes, :PostId, :integer
  end
end
