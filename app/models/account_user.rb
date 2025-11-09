class AccountUser < ApplicationRecord
  belongs_to :user
  belongs_to :account

  has_many :permissions, dependent: :destroy

  enum :role, { owner: 0, admin: 1, member: 2 }, suffix: true
end
