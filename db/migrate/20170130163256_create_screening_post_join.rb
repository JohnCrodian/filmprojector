class CreateScreeningPostJoin < ActiveRecord::Migration[5.0]
  def change
    create_table :screening_post_joins do |t|
    	t.references :screening, foreign_key: true
    	t.references :post, foreign_key: true 
    end
  end
end
