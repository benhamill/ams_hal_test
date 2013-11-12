class MakePostBodyText < ActiveRecord::Migration
  def change
    change_table :posts do |t|
      t.remove :body
      t.text :body
    end
  end
end
