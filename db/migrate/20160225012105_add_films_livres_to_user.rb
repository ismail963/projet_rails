class AddFilmsLivresToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :films_vu_par_semaine, :int
    add_column :users, :lire_plus_livres, :boolean
  end

  def self.down
    remove_column :users, :films_vu_par_semaine
    remove_column :users, :lire_plus_livres
  end
end
