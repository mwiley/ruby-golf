class SubmissionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_challenge

  # POST /submissions
  # POST /submissions.json
  def create
    @submission = current_user.submissions.new(submission_params)
    result = SandboxService.query(@submission.challenge.title, @submission.code)
    puts result

    @submission.length = @submission.code.chars.length
    @submission.time = result['time']
    @submission.passed = result['passed']

    if @submission.passed?
      old_submission = @challenge.submissions.find_by(code: @submission.code, user: current_user)
      if old_submission.present?
        old_submission.update(time: @submission.time) if @submission.time < old_submission.time

        redirect_to(challenge_path(@challenge),
          notice: "Your code passed the test, but you've already submitted it.",
          result: result['result'])
      elsif @submission.save
        redirect_to(challenge_path(@challenge), notice: 'Submission was successfully created.',
          result: result['result'])
      else
        redirect_to(challenge_path(@challenge), alert: 'Something went wrong!')
      end
    else
      redirect_to(challenge_path(@challenge), alert: 'Your submission failed the test.',
        result: result['result'], error: result['error'])
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_challenge
      @challenge = Challenge.find(params[:challenge_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def submission_params
       { challenge_id: params[:challenge_id], code: params[:submission][:code].strip }
    end
end
