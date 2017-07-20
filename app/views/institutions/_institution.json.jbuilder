json.extract! institution, :id, :name, :cif, :address, :postal_code, :city, :country, :bank, :bank_no, :paypal, :created_at, :updated_at
json.url institution_url(institution, format: :json)
