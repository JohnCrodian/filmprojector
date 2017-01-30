class RenameTheOtherJoinTable < ActiveRecord::Migration[5.0]
  def change
  	rename_table :screening_post_joins, :posts_screenings
  end
end
