class CreateSolutions < ActiveRecord::Migration[6.1]
  def change
    create_table :solutions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :algorithm, null: false, foreign_key: true
      t.text :solution
      t.string :time_complexity
      t.string :space_complexity

      t.timestamps
    end
  end
end
