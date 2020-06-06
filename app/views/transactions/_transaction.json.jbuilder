json.extract! transaction, :id, :name, :user_id, :item_id, :spent, :spent_date, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
