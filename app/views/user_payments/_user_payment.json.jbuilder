json.extract! user_payment, :id, :user_id, :status, :issue_date, :payment_date, :created_at, :updated_at
json.url user_payment_url(user_payment, format: :json)
