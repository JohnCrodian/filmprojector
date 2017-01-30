class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :screening
      t.string :avatar_file_name
      t.string :avatar_content_type
      t.string :avatar_file_size

      t.timestamps
    end
  end
end
