class CreateRefrigerators < ActiveRecord::Migration[6.0]
  def change
    create_table :refrigerators do |t|
      t.string :foodstuff,       null: false
      t.string :buy,             null: false
      t.references :user,        foreign_key: true
      t.timestamps
    end
  end
end
