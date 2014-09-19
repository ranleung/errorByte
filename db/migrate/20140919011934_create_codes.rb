class CreateCodes < ActiveRecord::Migration
  def change
    create_table :codes do |t|
      t.string :level
      t.text :question
      t.text :correctCode
      t.text :wrongCode
      t.text :hint

      t.timestamps
    end
  end
end
