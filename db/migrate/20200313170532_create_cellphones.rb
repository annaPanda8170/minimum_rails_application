class CreateCellphones < ActiveRecord::Migration[5.2]
  def change
    create_table :cellphones do |t|
      t.integer :cellphone
      t.references :user
      t.timestamps
    end
  end
end
