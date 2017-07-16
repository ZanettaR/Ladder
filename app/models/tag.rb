class Tag < ApplicationRecord
  include TagValidationHelper

  # Associations
  has_many :user_interests
  has_many :user_specialties

  # Validations
  validates :name, presence: true
  validates :name, length: { in: 2..50 }

  # Validation Callbacks
  before_validation :sanatize_name
end
