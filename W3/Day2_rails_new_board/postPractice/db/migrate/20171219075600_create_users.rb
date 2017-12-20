class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.text :title
      t.text :content

      t.timestamps null: false
    end
  end
end
