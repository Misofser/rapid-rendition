class VotesController < ApplicationController
  def create
    @vote = Vote.new(vote_params)
    @vote.sketch_id = params[:sketch_id]
    if @vote.save
      redirect_to sketch_path(@vote.sketch)
    else
      render 'new'
    end
  end
  
  private
    def vote_params
      params.require(:vote).permit(:value)
    end
end