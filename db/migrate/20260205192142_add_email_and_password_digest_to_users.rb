class AddEmailAndPasswordDigestToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :email, :string, null: false, default: ''
    add_index :users, :email, unique: true
    add_column :users, :password_digest, :string, null: false, default: ''
  end
end
