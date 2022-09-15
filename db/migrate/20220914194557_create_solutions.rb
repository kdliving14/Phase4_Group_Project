class CreateSolutions < ActiveRecord::Migration[6.1]
  def change
    create_table :solutions do |t|
      t.text :solution
      t.string :time_complexity
      t.string :space_complexity
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :algorithm, null: false, foreign_key: true

      t.timestamps
    end
  end
end
