class User < ApplicationRecord

  validates :name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: {case_sensitve: false}, format: {with: VALID_EMAIL_REGEX}
  validates :password, presence: true, length: { minimum: 3}

  has_secure_password
end
