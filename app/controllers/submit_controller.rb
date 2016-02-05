class SubmitController < ApplicationController
  def show
  end

  def new
    uri = URI('http://localhost:4567/eval/' + params[:problem])
    res = Net::HTTP.post_form(uri, code: params[:code])
    @result = res.body

    respond_to do |format|
      format.js
    end
  end
end
