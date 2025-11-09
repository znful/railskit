class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy

  has_many :account_users, dependent: :destroy
  has_many :accounts, through: :account_users
  has_many :invitations, dependent: :destroy

  validates :email_address, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  normalizes :email_address, with: ->(e) { e.strip.downcase }
end
