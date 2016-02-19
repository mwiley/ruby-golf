json.array!(@challenges) do |challenge|
  json.extract! challenge, :id, :title, :descripton
  json.url challenge_url(challenge, format: :json)
end
