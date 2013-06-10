class CreateAddressTableInfoAsses < ActiveRecord::Migration
  def change
    create_table :address_table_info_asses do |t|

    	t.references :TableInfo
    	t.references :Address
      t.timestamps
    end
  end
end
