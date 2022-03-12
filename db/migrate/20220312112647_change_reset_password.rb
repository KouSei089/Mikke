class ChangeResetPassword < ActiveRecord::Migration[6.0]
  def change
    remove_index :users, :reset_password_token
    add_index :users, :reset_password_token, unique: true
  end
end
