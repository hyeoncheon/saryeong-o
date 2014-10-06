json.array!(@servers) do |server|
  json.extract! server, :id, :hostname, :os, :arch, :version, :uuid
  json.url server_url(server, format: :json)
end
