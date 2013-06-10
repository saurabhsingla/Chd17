class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :addressLine1
      t.string :addressLine2
      t.string :addressLine3
      t.string :city
      t.string :state
      t.integer :pinCode
      t.integer :contactNumber1
      t.integer :contactNumber2
      t.integer :contactNumber3

      t.references :RefCountry

      t.timestamps
    end
  end
end
