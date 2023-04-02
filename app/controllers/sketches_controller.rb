class SketchesController < ApplicationController
  
  before_action :require_user, only: [:new, :edit, :update, :destroy]
  before_action :set_sketch, only: [:show, :edit, :update, :destroy]
  before_action -> { authorize_user (@sketch) }, only: [:edit, :update, :destroy]

  def index
    @sketches = Sketch.all
  end

  def show
    @voted = @sketch.votes.where(user: current_user).exists?
  end
  
  def new
    @sketch = Sketch.new
  end

  def create
    @sketch = current_user.sketches.build(sketch_params)
    if @sketch.save
      redirect_to @sketch
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @sketch.image.attach(params[:image])
    if @sketch.update(sketch_params)
      redirect_to @sketch
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @sketch.destroy
    
    redirect_to root_path, status: :see_other
  end

  private

    def sketch_params
      params.require(:sketch).permit(:image, :challenge_id)
    end
  
    def set_sketch
      @sketch = Sketch.find(params[:id])
    end  

end
