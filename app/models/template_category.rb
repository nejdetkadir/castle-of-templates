class TemplateCategory < ApplicationRecord
  has_many :templates

  # scopes
  scope :active, -> { where(public: true) }
end
