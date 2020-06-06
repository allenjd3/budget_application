json.extract! paycheck, :id, :name, :payday, :payday_date, :user_id, :created_at, :updated_at
json.url paycheck_url(paycheck, format: :json)
