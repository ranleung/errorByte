class CreateCompletes < ActiveRecord::Migration
  def change
    create_table :completes do |t|
      t.boolean :complete, :default => false
      t.references :user, index: true
      t.references :code, index:true

      t.timestamps
    end
  end
end
