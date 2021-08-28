class Template < ApplicationRecord
  
  # searchkick
  searchkick

  # associations
  belongs_to :user
  belongs_to :template_category
  has_rich_text :instructions

  # mounts
  mount_uploader :icon, TemplateIconUploader

  # validations
  validates_presence_of [:name, :description, :script]

  # scopes
  scope :active, -> { where(public: true) }
end
