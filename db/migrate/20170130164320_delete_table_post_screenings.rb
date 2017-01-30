class DeleteTablePostScreenings < ActiveRecord::Migration[5.0]
  def change
  	drop_table :posts_screenings
  end
end
