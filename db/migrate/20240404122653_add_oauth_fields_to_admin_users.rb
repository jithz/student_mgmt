class AddOauthFieldsToAdminUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :admin_users, :name, :string
    add_column :admin_users, :image, :string
    add_column :admin_users, :uid, :string
    add_column :admin_users, :provider, :string
  end
end
