class Template < ApplicationRecord

  # associations
  belongs_to :user
  has_rich_text :instructions

  # mounts
  mount_uploader :icon, TemplateIconUploader

  # validations
  validates_presence_of [:name, :description, :script]

  # scopes
  scope :active, -> { where(public: true) }
end
