class CreateSuggestions < ActiveRecord::Migration
  def change
    create_table :suggestions do |t|
      t.text :suggestion
      t.boolean :checkedFlag

      t.timestamps
    end
  end
end
