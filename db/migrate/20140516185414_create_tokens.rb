class CreateTokens < ActiveRecord::Migration
  def change
    create_table :tokens do |t|
      t.integer :app_detail_id
      t.string :code
      t.string :access_token

      t.timestamps
    end
  end
end
