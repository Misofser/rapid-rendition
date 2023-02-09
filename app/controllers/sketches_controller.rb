class SketchesController < ApplicationController
  def index
    @sketches = Sketch.all
  end

  def show
    @sketch = Sketch.find(params[:id])
  end
  
  def new
    @sketch = Sketch.new
  end

  def create
    @sketch = Sketch.create!(sketch_params)
    redirect_to @sketch
  end

  def edit
    @sketch = Sketch.find(params[:id])
  end

  def update
    @sketch = Sketch.find(params[:id])
    @sketch.image.attach(params[:image])
    if @sketch.update(sketch_params)
      redirect_to @sketch
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @sketch = Sketch.find(params[:id])
    @sketch.destroy
    
    redirect_to root_path, status: :see_other
  end

  private
    def sketch_params
      params.require(:sketch).permit(:image)
    end
end
