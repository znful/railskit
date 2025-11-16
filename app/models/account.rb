class Account < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :account_users, dependent: :destroy
  has_many :users, through: :account_users
  has_many :invitations, dependent: :destroy

  validates :name, presence: true
  validates :slug, presence: true, uniqueness: true

  after_create :link_owner

  def to_param
    slug
  end

  private
  def link_owner
    account_user = AccountUser.find_by(account: self, user: self.owner)
    return if account_user

    Account.transaction do
      AccountUser.create!(user: self.owner, account: self, role: :owner)
    end
  end
end
