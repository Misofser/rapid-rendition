class VotesController < ApplicationController
  
  before_action :require_user, only: [:create, :destroy]
  before_action :set_sketch, only: [:create, :destroy]
  before_action :set_vote, only: [:destroy]
  before_action -> { authorize_user (@vote) }, only: [:destroy]

  def show
    @vote = Vote.find(params[:id])
  end
  
  def create
    if Vote.exists?(user: current_user, sketch: @sketch)
      render status: :unprocessable_entity, body: "Already voted"
    elsif @sketch.votes.create(user: current_user)
      render status: :ok, body: "Vote added successfully"
    else
      render status: :unprocessable_entity, body: "Error adding vote"
    end
  end

  def destroy
    vote = @sketch.votes.find_by(user: current_user)
    if vote && vote.destroy
      render status: :ok, body: "Vote removed successfully"
    else
      render status: :unprocessable_entity, body: "Error removing vote"
    end
  end

  private

  def set_sketch
    @sketch = Sketch.find(params[:sketch_id])
  end

  def set_vote
    @vote = Vote.find_by(user: current_user, sketch: @sketch)
  end

  def vote_params
    params.require(:vote).permit(:value, :user_id)
  end

end
