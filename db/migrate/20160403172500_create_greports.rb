class CreateGreports < ActiveRecord::Migration
  def change
    create_table :greports do |t|
      t.decimal :roll
      t.string :name
      t.decimal :marksobt
      t.decimal :marksout
      t.string :result
      t.float :sgpa

      t.timestamps null: false
    end
  end
end
