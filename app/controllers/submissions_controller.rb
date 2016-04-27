class SubmissionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_submission, only: [:show, :edit, :update, :destroy]
  before_action :set_challenge

  # POST /submissions
  # POST /submissions.json
  def create
    @challenge = Challenge.find(params[:challenge_id])
    @submission = current_user.submissions
      .new(challenge_id: params[:challenge_id], code: params[:submission][:code].strip)

    if @challenge.submissions.where(code: params[:submission][:code].strip).any?
      redirect_to challenge_path(@challenge), notice: 'Your submission has already been used.'
    else
      result = SandboxService.query(@submission.challenge.title, @submission.code)

      puts result

      @submission.time = result['time']
      @submission.passed = result['passed']

      # count non-space characters
      @submission.length = @submission.code.chars.reject { |c| c != ' ' && c != "\n" }.length

      if !@submission.passed?
        redirect_to challenge_path(@challenge), notice: 'Your submission failed the test.'
      elsif @submission.save
        redirect_to challenge_path(@challenge), notice: 'Submission was successfully created.'
      else
        redirect_to challenge_path(@challenge), notice: 'Something went wrong!'
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_submission
      @submission = Submission.find(params[:id])
    end

    def set_challenge
      @challenge = Challenge.find(params[:challenge_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def submission_params
      params.require(:submission).permit(:challenge_id, :code)
    end
end
