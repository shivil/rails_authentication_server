class ChangeColumnNameAppDetailIdToUserId < ActiveRecord::Migration
  def change
  	rename_column :tokens, :app_detail_id, :user_id
  end
end
