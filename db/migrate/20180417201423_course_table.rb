class CourseTable < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.column :name, :string
      t.column :link, :string
      t.timestamps
    end

    create_table :weeks do |t|
      t.belongs_to :courses, index: true
      t.column :number, :integer
      t.column :description, :string
      t.timestamps
    end 
  end
end
