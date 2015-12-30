class InitialSchema < ActiveRecord::Migration
  def up

    create_table :games do |t|
      t.string :name, null: false
      t.timestamps null: false
    end

    create_table :users do |t|
      t.string :username, default: "Anonymous", null: false
      t.boolean :admin, default: false, null: false
      t.references :game, null: false
      t.timestamps null: false
    end

    create_table :user_cards do |t|
      t.references :user, null: false
      t.references :card, null: false
      t.timestamps null: false
    end

    create_table :cards do |t|
      t.integer :value, null: false
      t.string :suit, null: false
      t.timestamps null: false
    end

  end

  def down
    drop_table :games
    drop_table :users
    drop_table :user_cards
    drop_table :cards
  end
end
