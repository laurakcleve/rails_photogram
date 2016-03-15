require_relative '20160307183531_create_notifications'

class FixCreateNotifications < ActiveRecord::Migration
  def change
    revert CreateNotifications

    create_table :notifications do |t|
      t.references :user, index: true
      t.references :notified_by, index: true
      t.references :post, index: true
      t.integer :identifier
      t.string :notice_type
      t.boolean :read, default: false

      t.timestamps null: false
    end
    add_foreign_key :notifications, :users
    add_foreign_key :notifications, :users, column: :notified_by_id
    add_foreign_key :notifications, :posts
  end
end