class AddDeviseToCustomers < ActiveRecord::Migration
  def self.up
    change_table(:customers) do |t|
      t.database_authenticatable :null => false
      t.rememberable
      t.trackable
      t.string :username
      t.string :plaintext_password

      # t.recoverable
      # t.encryptable
      # t.confirmable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      # t.token_authenticatable


      # Uncomment below if timestamps were not included in your original model.
      # t.timestamps
    end

    # add_index :customers, :reset_password_token, :unique => true
    # add_index :customers, :confirmation_token,   :unique => true
    # add_index :customers, :unlock_token,         :unique => true
    # add_index :customers, :authentication_token, :unique => true
  end

  def self.down
    # By default, we don't want to make any assumption about how to roll back a migration when your
    # model already existed. Please edit below which fields you would like to remove in this migration.
    remove_index :customers, :username
    remove_column :customers, :email
    remove_column :customers, :encrypted_password
    remove_column :customers, :remember_created_at
    remove_column :customers, :sign_in_count
    remove_column :customers, :current_sign_in_at
    remove_column :customers, :last_sign_in_at
    remove_column :customers, :current_sign_in_ip
    remove_column :customers, :last_sign_in_ip
    remove_column :customers, :username
    remove_column :customers, :plaintext_password
  end
end
