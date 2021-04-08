class CreateBlogs < ActiveRecord::Migration[6.0]
  def change
    create_table :blogs do |t|
      t.string :title,          null: false
      t.text :content
      t.datetime :strat_time,   null: false
      t.references :user,       foreign_key: true
      t.timestamps
    end
  end
end
