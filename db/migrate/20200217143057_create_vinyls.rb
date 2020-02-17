class CreateVinyls < ActiveRecord::Migration[5.2]
  def change
    create_table :vinyls do |t|
      t.string :name
      t.date :relase_date
      t.float :price_per_day

      t.timestamps
    end
  end
end
