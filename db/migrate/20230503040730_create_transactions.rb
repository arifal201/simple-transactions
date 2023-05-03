class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.integer :qty
      t.references :product
      t.references :customer
      t.references :payment_method

      t.timestamps
    end
  end
end
