class FixResponse < ActiveRecord::Migration[5.1]
  def change
    remove_column :responses, :answer_choice
    add_column :responses, :choice_id, :integer, null: false
  end
end
