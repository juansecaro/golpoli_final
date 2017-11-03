json.extract! reservation, :id, :institution_id, :pitch_id, :user_id, :user_email, :amount, :selected_date, :selected_times, :refund, :refund_reason, :refunded, :fingerprint, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
