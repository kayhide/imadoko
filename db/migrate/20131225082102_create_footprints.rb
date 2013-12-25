class CreateFootprints < ActiveRecord::Migration
  def change
    create_table :footprints do |t|
      t.references :entry, index: true
      t.float :distance
      t.timestamp :passed_at

      t.timestamps
    end
  end
end
