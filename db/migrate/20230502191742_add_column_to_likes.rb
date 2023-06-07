class AddColumnToLikes < ActiveRecord::Migration[7.0]
  def change
    add_column :likes, :UserId, :integer
    add_column :likes, :PostId, :integer
  end
end
