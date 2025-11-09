json.extract! invitation, :id, :account_id, :token, :message, :receiver, :sender_id, :created_at, :updated_at
json.url invitation_url(inivitation, format: :json)
