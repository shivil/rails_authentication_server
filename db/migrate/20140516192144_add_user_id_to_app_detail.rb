class AddUserIdToAppDetail < ActiveRecord::Migration
  def change
  	add_column :app_details, :user_id, :integer, after: :name
    add_index :app_details, :user_id
  end
end
