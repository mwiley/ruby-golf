class SandboxService
  if Rails.env.production?
    endpoint_url = ENV['SANDBOX_URL']
  else
    endpoint_url = 'http://192.168.2.7:4567/eval/'
  end

  def self.query(problem_name, code)
    uri = URI(endpoint_url + problem_name)
    res = Net::HTTP.post_form(uri, code: code)
    JSON.parse(res.body)
  end
end
