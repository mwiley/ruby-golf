class SubmissionsController < ApplicationController
  before_action :set_submission, only: [:show, :edit, :update, :destroy]
  before_action :set_challenge

  # GET /submissions
  # GET /submissions.json
  def index
    @submissions = Submission.where(challenge: @challenge)
  end

  # GET /submissions/1
  # GET /submissions/1.json
  def show
  end

  # GET /submissions/new
  def new
    @submission = Submission.new
  end

  # GET /submissions/1/edit
  def edit
  end

  # POST /submissions
  # POST /submissions.json
  def create
    @challenge = Challenge.find(params[:challenge_id])
    @submission = Submission.new(challenge_id: params[:challenge_id], code: params[:submission][:code])

    result = SandboxService.query(@submission.challenge.title, @submission.code)
    @submission.time = result['time']
    @submission.passed = result['passed']
    @submission.length = @submission.code.length

    @submission.errors.add(:passed, 'Your code did not pass the test.') unless @submission.passed?

    respond_to do |format|
      if @submission.passed? && @submission.save
        format.html { redirect_to challenge_submission_path(@challenge, @submission),
                      notice: 'Submission was successfully created.' }
        format.json { render :show, status: :created, location: @submission }
      else
        format.html { render :new }
        format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /submissions/1
  # PATCH/PUT /submissions/1.json
  def update
    respond_to do |format|
      if @submission.update(submission_params)
        format.html { redirect_to @submission, notice: 'Submission was successfully updated.' }
        format.json { render :show, status: :ok, location: @submission }
      else
        format.html { render :edit }
        format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /submissions/1
  # DELETE /submissions/1.json
  def destroy
    @submission.destroy
    respond_to do |format|
      format.html { redirect_to submissions_url, notice: 'Submission was successfully destroyed.' }
      format.json { head :no_content }
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
