class AddUserIdToGreport < ActiveRecord::Migration
  def change
    add_column :greports ,:user_id , :integer
  end
end
