class CreateLikeds < ActiveRecord::Migration[6.1]
  def change
    create_table :likeds do |t|
      t.references :user, null: false, foreign_key: true
      t.references :template, null: false, foreign_key: true

      t.timestamps
    end
  end
end
