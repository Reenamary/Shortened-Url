class CreateShortenUrls < ActiveRecord::Migration[5.2]
  def self.up
    create_table :shorten_urls do |t|
      t.text :url
      t.text :short_url
      t.integer :clicked, default: 0
      t.timestamps
    end
  end

  def self.down
    drop_table :shorten_urls
  end
end
