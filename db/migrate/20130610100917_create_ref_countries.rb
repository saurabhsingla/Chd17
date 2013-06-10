class CreateRefCountries < ActiveRecord::Migration
  def change
    create_table :ref_countries do |t|
      t.string :isoCode
      t.string :countryName

      t.timestamps
    end
  end
end
