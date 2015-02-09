class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.text :plot
      t.string :actors
      t.datetime :released
      t.string :genre
      t.string :trailer
      t.timestamps null: false
    end
  end
end
