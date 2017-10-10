class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :uid
      t.string :nickname
      t.string :provider
      t.string :email
      t.string :token
      t.string :image_url
      t.datetime :oauth_expires_at

      t.timestamps
    end
  end
end
