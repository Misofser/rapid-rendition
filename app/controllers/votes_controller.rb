class VotesController < ApplicationController
  
  before_action :require_user, only: [:create, :destroy]
  before_action :set_sketch, only: [:create, :destroy]
  before_action :set_vote, only: [:destroy]
  before_action -> { authorize_user (@vote) }, only: [:destroy]

  def show
    @vote = Vote.find(params[:id])
  end

  def create
    @vote = @sketch.votes.build(vote_params)
    @vote.user = current_user

    if Vote.exists?(user: current_user, sketch: @sketch)
      flash[:error] = "You have already voted on this sketch"
      redirect_to @sketch
    else
      if @vote.save
        flash[:success] = "Vote created successfully!"
        redirect_to sketch_path(@vote.sketch)
      else
        render 'sketches/show'
      end
    end
  end
  
  def destroy
    if @vote.destroy
      flash[:success] = "Vote removed successfully!"
    else
      flash[:error] = "Failed to remove vote"
    end
    redirect_to sketch_path(@sketch)
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
