class SandboxService
  def self.query(problem_name, code)
    uri = URI('http://192.168.2.7:4567/eval/' + problem_name)
    res = Net::HTTP.post_form(uri, code: code)
    JSON.parse(res.body)
  end
end
