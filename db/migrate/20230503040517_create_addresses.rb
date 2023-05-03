class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :phone
      t.references :customer

      t.timestamps
    end
  end
end
