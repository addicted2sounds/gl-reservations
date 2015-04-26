json.array!(@reservations) do |reservation|
  json.extract! reservation, :id, :table_id, :start, :end
  json.url reservation_url(reservation, format: :json)
end
