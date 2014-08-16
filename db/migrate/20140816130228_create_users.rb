class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :uid, null: false
      t.string :name, null: false
      t.string :nickname, null: false
      t.string :image, null: false

      t.index :uid, unique: true
    end
  end
end
