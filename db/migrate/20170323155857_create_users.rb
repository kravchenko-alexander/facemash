class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :first_name
      t.string :last_name
      t.string :type

      t.timestamps null: false
    end

    add_index :users, [:email, :type], name: 'users_email_type_index'
  end
end
