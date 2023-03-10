class ChallengesController < ApplicationController
  
  before_action :require_user, only: [:new, :edit, :destroy]
  before_action :set_challenge, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user, only: [:edit, :destroy]
  before_action :require_admin, only: [:new, :edit, :destroy]

  def index
    @challenges = Challenge.all
  end

  def show
  end

  def new
    @challenge = Challenge.new
  end

  def create
    @challenge = current_user.challenges.build(challenge_params)
    if @challenge.save
      redirect_to @challenge
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def challenge_params
    params.require(:challenge).permit(:title, :description, :user_id)
  end

  def set_challenge
    @challenge = Challenge.find(params[:id])
  end 

end
