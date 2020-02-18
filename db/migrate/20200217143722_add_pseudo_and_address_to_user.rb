class AddPseudoAndAddressToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :pseudo, :string
    add_column :users, :address, :string
  end
end
