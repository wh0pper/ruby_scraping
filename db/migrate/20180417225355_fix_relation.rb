class FixRelation < ActiveRecord::Migration[5.1]
  def change
    remove_column :weeks, :courses_id, :bigint
    add_reference :weeks, :course, index: true
  end
end
