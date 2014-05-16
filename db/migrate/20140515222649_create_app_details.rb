class CreateAppDetails < ActiveRecord::Migration
  def change
    create_table :app_details do |t|
      t.string :name
      t.text :redirect_url
      t.string :client_id
      t.string :secret_code

      t.timestamps
    end
  end
end
