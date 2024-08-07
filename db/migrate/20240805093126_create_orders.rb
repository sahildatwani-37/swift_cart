class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :customer_email
      t.decimal :total_price
      t.string :status
      t.datetime :order_date
      t.text :shipping_address
      t.string :payment_method

      t.timestamps
    end
  end
end
