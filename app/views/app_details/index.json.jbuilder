json.array!(@app_details) do |app_detail|
  json.extract! app_detail, :id, :name, :redirect_url, :client_id, :secret_code
  json.url app_detail_url(app_detail, format: :json)
end
