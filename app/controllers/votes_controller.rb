class VotesController < ApplicationController
  def create
    @sketch = Sketch.find(params[:sketch_id])
    @vote = @sketch.votes.create
    redirect_to sketch_path(@sketch)
  end
    
end
  