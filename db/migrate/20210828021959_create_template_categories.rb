class CreateTemplateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :template_categories do |t|
      t.string :name
      t.boolean :public, default: true

      t.timestamps
    end
  end
end
