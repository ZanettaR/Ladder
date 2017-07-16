class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Associations
  has_many :user_interests
  has_many :user_specialties

  # Validations
  validates :first_name, :last_name, presence: true
  validates :first_name, :last_name, length: { in: 2..30 }
  validates :first_name, :last_name, format: { with: /\A[a-zA-Z]+\z/ }, if: -> { first_name.present? }
  validates :photo, presence: true
  validates :gender, presence: true
  validates :gender, inclusion: %w( female male other )
  validates :birth_year, presence: true
  validates :birth_year, numericality: { greater_than_or_equal_to: Date.today.year - 65, less_than_or_equal_to: Date.today.year - 16 }
end
