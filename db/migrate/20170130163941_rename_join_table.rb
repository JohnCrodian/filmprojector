class RenameJoinTable < ActiveRecord::Migration[5.0]
  def change
  	rename_table :add_screening_to_posts, :posts_screenings
  end
end
