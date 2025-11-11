class AccountUserPermission < ApplicationRecord
  belongs_to :account_user
  belongs_to :permission
end
