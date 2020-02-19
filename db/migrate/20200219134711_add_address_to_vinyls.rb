class AddAddressToVinyls < ActiveRecord::Migration[5.2]
  def change
    add_column :vinyls, :address, :string
  end
end
