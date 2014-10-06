json.array!(@ip_addrs) do |ip_addr|
  json.extract! ip_addr, :id, :addr, :default, :server_id
  json.url ip_addr_url(ip_addr, format: :json)
end
