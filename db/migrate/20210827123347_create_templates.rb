class CreateTemplates < ActiveRecord::Migration[6.1]
  def change
    create_table :templates do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :icon
      t.string :description
      t.text :script
      t.boolean :public

      t.timestamps
    end
  end
end
