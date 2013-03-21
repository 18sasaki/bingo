class CreateNumbers < ActiveRecord::Migration
  def change
    create_table :numbers do |t|
      t.integer :game_id
      t.integer :num
      t.string :division

      t.timestamps
    end
  end
end
