class AddStatustoUsers < ActiveRecord::Migration
  def change
     add_column :users, :status, :string, default: ''
  end
end
