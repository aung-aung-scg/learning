class CreateCourses < ActiveRecord::Migration[7.1]
  def change
    create_table :courses do |t|
      t.string :title
      t.text :description
      t.string :level
      t.boolean :is_premium, default: false
      t.string :thumbnail_url

      t.timestamps
    end
  end
end
