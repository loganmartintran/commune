class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :value
      t.references :user
      t.references :post

      t.timestamps null: false
    end
    add_index :votes, :user
    add_index :votes, :post
  end
end
