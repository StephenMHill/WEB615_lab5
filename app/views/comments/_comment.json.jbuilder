json.extract! comment, :id, :message, :user, :article, :created_at, :updated_at
json.url comment_url(comment, format: :json)
