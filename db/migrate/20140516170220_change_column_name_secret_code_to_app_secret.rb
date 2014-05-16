class ChangeColumnNameSecretCodeToAppSecret < ActiveRecord::Migration
  def change
  	rename_column :app_details, :secret_code, :app_secret
  end
end
