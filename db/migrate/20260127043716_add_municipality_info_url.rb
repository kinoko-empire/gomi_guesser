class AddMunicipalityInfoUrl < ActiveRecord::Migration[8.0]
  def change
    add_column :municipalities, :info_url, :string
  end
end
