class AddColumnToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :UserId, :integer
    add_column :comments, :PostId, :integer
    add_column :comments, :Text, :text
  end
end
