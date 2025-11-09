class Inivitation < ApplicationRecord
  belongs_to :account
  belongs_to :sender
end
