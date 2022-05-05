class AddColumnZipCodeToCity < ActiveRecord::Migration[5.2]
  def change
    add_column :cities, :zip_code, :string
  end
end
