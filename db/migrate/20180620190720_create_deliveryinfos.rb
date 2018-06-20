class CreateDeliveryinfos < ActiveRecord::Migration[5.1]
  def change
    create_table :deliveryinfos do |t|
      t.references :order, foreign_key: true
      t.string :line1
      t.string :line2
      t.integer :phone

      t.timestamps
    end
  end
end
