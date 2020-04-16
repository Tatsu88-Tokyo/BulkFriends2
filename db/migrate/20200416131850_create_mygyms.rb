class CreateMygyms < ActiveRecord::Migration[5.2]
  def change
    create_table :mygyms do |t|
      t.string  :gym, null: false
      t.string  :tweet
      t.references :user, null: false, foreign_key: true


      t.timestamps
    end
  end
end
