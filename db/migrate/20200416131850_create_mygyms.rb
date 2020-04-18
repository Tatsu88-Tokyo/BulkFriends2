class CreateMygyms < ActiveRecord::Migration[5.2]
  def change
    create_table :mygyms do |t|
      t.integer   :gym, null: false, default: 0
      t.references :user, null: false, foreign_key: true


      t.timestamps
    end
  end
end
