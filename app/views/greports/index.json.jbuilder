json.array!(@greports) do |greport|
  json.extract! greport, :id, :roll, :name, :marksobt, :marksout, :result, :sgpa
  json.url greport_url(greport, format: :json)
end
