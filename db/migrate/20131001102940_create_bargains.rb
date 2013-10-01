class CreateBargains < ActiveRecord::Migration
  def change
    create_table :bargains do |t|
      t.string :tag
      t.datetime :deadline

      t.timestamps
    end
  end
end
