class AddNicknameToUser < ActiveRecord::Migration
  def change
    add_column :users, :nickname, :text
  end
end
