class CreateTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :tracks do |t|
      t.string :name
      t.references :vinyl, foreign_key: true

      t.timestamps
    end
  end
end
