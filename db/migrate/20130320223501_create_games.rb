class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :total

      t.timestamps
    end
  end
end
