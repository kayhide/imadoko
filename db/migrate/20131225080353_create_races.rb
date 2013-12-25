class CreateRaces < ActiveRecord::Migration
  def change
    create_table :races do |t|
      t.string :label
      t.string :url
      t.string :crawler
      t.float :distance
      t.timestamp :starts_at
      t.timestamp :ends_at

      t.timestamps
    end
  end
end
