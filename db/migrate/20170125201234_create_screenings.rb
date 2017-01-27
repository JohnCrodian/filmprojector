class CreateScreenings < ActiveRecord::Migration[5.0]
  def change
    create_table :screenings do |t|
      t.string :title
      t.date :showtime
      t.string :location
      t.string :link
    end
  end
end
