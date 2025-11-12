class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy

  has_many :account_users, dependent: :destroy
  has_many :accounts, through: :account_users
  has_many :invitations, dependent: :destroy
  belongs_to :default_account, optional: true, class_name: "Account"

  validates :email_address, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :first_name, presence: true
  validates :last_name, presence: true
  normalizes :email_address, with: ->(e) { e.strip.downcase }

  after_create :create_default_account

  private
  def create_default_account
    Account.transaction do
      account = Account.create!(name: self.first_name, slug: "#{SecureRandom.hex(8)}", owner: self)
      AccountUser.create!(user: self, account: account, role: :owner)
      self.update default_account: account
    end
  end
end
