class VotesController < ApplicationController
  
  before_action :require_user, only: [:create]

  def create
    @sketch = Sketch.find(params[:sketch_id])
    @vote = @sketch.votes.build(vote_params)
    @vote.user = current_user
    if @vote.save
      redirect_to sketch_path(@vote.sketch)
    else
      render 'new'
    end
  end
  
  private
    def vote_params
      params.require(:vote).permit(:value, :user_id)
    end
end
