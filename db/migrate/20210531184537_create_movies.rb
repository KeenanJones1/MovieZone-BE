class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :up_count
      t.integer :down_count
      t.string :query
      t.timestamps
    end
  end
end
