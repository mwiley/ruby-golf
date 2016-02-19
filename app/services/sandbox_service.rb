class SandboxService
  def self.query(problem_name, code)
    uri = URI('http://localhost:4567/eval/' + problem_name)
    res = Net::HTTP.post_form(uri, code: code)
    JSON.parse(res.body)
  end
end
