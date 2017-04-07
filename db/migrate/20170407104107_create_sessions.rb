class CreateSessions < ActiveRecord::Migration[5.0]
  def change
    create_table :sessions do |t|
      t.string :access_token, null: false
      t.string :refresh_token, null: false
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end

    add_index :sessions, [:access_token, :refresh_token], name: 'sessions_tokens_index'
    add_index :sessions, [:access_token, :user_id], name: 'sessions_user_access_token_index'
  end
end
