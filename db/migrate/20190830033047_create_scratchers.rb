class CreateScratchers < ActiveRecord::Migration[6.0]
  def change
    create_table :scratchers do |t|
      t.string :title
      t.string :description
      t.string :size
      t.decimal :price

      t.timestamps
    end
  end
end
