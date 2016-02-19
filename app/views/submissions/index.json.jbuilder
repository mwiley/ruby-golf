json.array!(@submissions) do |submission|
  json.extract! submission, :id, :challenge_id, :code, :time, :length
  json.url submission_url(submission, format: :json)
end
