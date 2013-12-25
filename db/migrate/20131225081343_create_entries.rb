class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.references :race, index: true
      t.string :number
      t.string :status

      t.timestamps
    end
  end
end
