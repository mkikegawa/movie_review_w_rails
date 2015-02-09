class AddEarningsToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :earnings, :float
  end
end
