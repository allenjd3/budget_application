json.extract! item, :id, :name, :planned, :user_id, :category_id, :created_at, :updated_at
json.url item_url(item, format: :json)
