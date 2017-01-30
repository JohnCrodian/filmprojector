class CreateAddScreeningToPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :add_screening_to_posts do |t|

      t.timestamps
    end
  end
end
