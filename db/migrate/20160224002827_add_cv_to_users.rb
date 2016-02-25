class AddCvToUsers < ActiveRecord::Migration

  def self.up
    add_column :users, :cv, :string
  end

  def self.down
    remove_column :users, :cv
  end
end
