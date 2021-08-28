class AddTemplateCategoryToTemplate < ActiveRecord::Migration[6.1]
  def change
    add_reference :templates, :template_category, null: false, foreign_key: true
  end
end
