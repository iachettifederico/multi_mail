class CreateInboundEmails < ActiveRecord::Migration[7.0]
  def change
    create_table :inbound_emails do |t|
      t.string :from
      t.string :to
      t.string :subject
      t.text :raw_body
      t.string :message_id
      t.datetime :date

      t.timestamps
    end
  end
end
