class ChallengesController < ApplicationController

  def index
    @challenges = Challenge.all
  end

  def show
    @challenge = Challenge.find(params[:id])
  end

  def new
    @challenge = Challenge.new
  end

  def create
    @challenge = Challenge.new(challenge_params)

    if @challenge.save
      redirect_to @challenge
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def challenge_params
    params.require(:challenge).permit(:title, :description)
  end

end
