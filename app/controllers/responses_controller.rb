class ResponsesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  before_action :set_question, only: [:create, :update, :destroy]
  before_action :set_response, only: [:update, :destroy]
  before_action :confirm_user, only: [:update, :destroy]

  # POST /responses
  # POST /responses.json
  def create
    @response = @question.answers.build(response_params.except(:target_response_token))
    if response_params[:target_response_token].present?
      @response.response = Response.find_by(id_token: response_params[:target_response_token])
    end
    @response.user = current_user

    respond_to do |format|
      if @response.save
        format.html { redirect_to @question, notice: 'response was successfully created.' }
        format.json { render :show, status: :created, location: @response }
      else
        format.html { redirect_to @question }
        format.json { render json: @response.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /responses/1
  # PATCH/PUT /responses/1.json
  def update
    respond_to do |format|
      if @response.update(response_params)
        format.html { redirect_to @question, notice: 'response was successfully updated.' }
        format.json { render :show, status: :ok, location: @response }
      else
        format.html { redirect_to @question }
        format.json { render json: @response.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /responses/1
  # DELETE /responses/1.json
  def destroy
    @response.destroy
    respond_to do |format|
      format.html { redirect_to @question, notice: 'response was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find_by(id_token: params[:question_id_token])
    end

    def set_response
      @response = Response.find_by(id_token: params[:response_id_token])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def response_params
      params.require(:response).permit(:content, :target_response_token)
    end

    def confirm_user
      redirect_to root_url if not current_user.responses.include?(@response)
    end
end
