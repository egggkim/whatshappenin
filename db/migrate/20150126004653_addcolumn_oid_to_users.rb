class AddcolumnOidToUsers < ActiveRecord::Migration
  def change
    add_column :users, :oid, :string
  end
end
