class CreateAuthtokens < ActiveRecord::Migration
  def change
    create_table :authtokens do |t|
      t.string :access_token
      t.string :user_id

      t.timestamps
    end
  end
end
