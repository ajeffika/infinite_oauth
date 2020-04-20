# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string   :name
      t.string   :surname
      t.string   :image_url
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string :provider, null: false
      t.string :uid, null: false
      t.string :token
      t.string :expiry

      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      t.datetime :remember_created_at



      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
end
