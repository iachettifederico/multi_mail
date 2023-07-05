class CreateInboundEmails < ActiveRecord::Migration[7.0]
  def change
    create_table :inbound_emails do |t|
      t.string :from,       null: false
      t.string :to,         null: false
      t.string :subject,    null: false
      t.text   :raw_body,   null: false
      t.string :message_id, null: false
      t.datetime :date,     null: false

      t.timestamps
    end
  end
end
