class CreateBlogs < ActiveRecord::Migration[6.0]
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :content
      t.string :author
      t.time :time

      t.timestamps
    end
  end
end
