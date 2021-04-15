class CreateUserPayments < ActiveRecord::Migration[6.1]
  def change
    create_table :user_payments do |t|
      t.references :user, null: false, foreign_key: true
      t.string :status
      t.datetime :issue_date
      t.datetime :payment_date

      t.timestamps
    end
  end
end
