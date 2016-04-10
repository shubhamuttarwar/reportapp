class AddMoreToGreports < ActiveRecord::Migration
  def change
    add_column :greports, :percent, :float
    add_column :greports, :exam, :text
    add_column :greports, :year, :integer
    add_column :greports, :sem, :integer
    add_column :greports, :session, :text
   add_column :greports, :batch, :text
  end
end
