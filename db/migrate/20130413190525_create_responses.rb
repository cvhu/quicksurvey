class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :question_id
      t.string :value
      t.string :type

      t.timestamps
    end
  end
end
