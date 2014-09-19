class CreateCodes < ActiveRecord::Migration
  def change
    create_table :codes do |t|
      t.string :level
      t.string :question
      t.string :correctCode
      t.string :wrongCode
      t.string :hint

      t.timestamps
    end
  end
end
