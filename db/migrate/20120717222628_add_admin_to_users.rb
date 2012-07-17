class AddAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean, default: false
    add_column :users, :editor, :boolean, default: false
    add_column :users, :viewer, :boolean, default: false
  end
end
