class VotesController < ApplicationController
  
  before_action :require_user, only: [:create]

  def create
    @sketch = Sketch.find(params[:sketch_id])
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
  
  private
    def vote_params
      params.require(:vote).permit(:value, :user_id)
    end
end
