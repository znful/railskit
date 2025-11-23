class Invitation < ApplicationRecord
  belongs_to :account
  belongs_to :sender, class_name: "User"

  validates :receiver, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :token, presence: true, uniqueness: true

  has_rich_text :message
end
