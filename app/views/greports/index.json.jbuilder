json.array!(@greports) do |greport|
  json.extract! greport, :id, :roll, :name, :marksobt, :marksout, :percent, :exam ,:sem, :session, :batch,:result, :sgpa
  json.url greport_url(greport, format: :json)
end
