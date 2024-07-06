# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :uid, null: false
      t.string :provider, null: false
    end
    add_index :users, [:uid, :provider], unique: true
  end
end
