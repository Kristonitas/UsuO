class TagsController < ApplicationController
  before_action :set_tag, only: [:show]

  def index
    @tags = ActsAsTaggableOn::Tag.all
  end

  def show
    @questions = Question.tagged_with(@tag.name)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = ActsAsTaggableOn::Tag.find_by(name: params[:name])
    end
end
