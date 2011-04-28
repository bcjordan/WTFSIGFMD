class CreateClicks < ActiveRecord::Migration
  def self.up
    create_table :clicks do |t|
      t.string :url
      t.string :request_ip
      t.string :user_agent
      t.string :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :clicks
  end
end
