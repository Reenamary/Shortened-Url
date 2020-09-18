class CreateUsers < ActiveRecord::Migration[5.2]
  def self.up
    create_table :users do |t|
      t.references :shorten_url, index: true, foreign_key: true
      t.text :ip_address
      t.text :country
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
