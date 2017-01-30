class RemoveScreeningColumnFromPostTable < ActiveRecord::Migration[5.0]
  def change
  	remove_column :posts, :screening
  end
end
