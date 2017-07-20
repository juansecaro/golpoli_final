json.extract! contact, :id, :name, :email, :phone, :job_title, :other, :institution_id, :created_at, :updated_at
json.url contact_url(contact, format: :json)
