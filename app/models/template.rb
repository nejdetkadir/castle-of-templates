class Template < ApplicationRecord

  # associations
  belongs_to :user
  has_rich_text :instructions

  # mounts
  mount_uploader :icon, TemplateIconUploader
end
