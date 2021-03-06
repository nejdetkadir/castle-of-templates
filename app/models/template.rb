class Template < ApplicationRecord
  
  # searchkick (only production)

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

  def shor_desc
    return self.description.length > 90 ? "#{self.description[0..90]}..." : self.description 
  end
end
