class PlantsController < ApplicationController

  def new
    #1.Find the specific garden parent instance that we want to attach a plant to
    @garden = Garden.find(params[:garden_id])
    #2.show the form with an empty instance ready to be filled in by the user
    @plant = Plant.new
    # raise
  end

  def create
    # 1.Find the garden parent with the params
    @garden = Garden.find(params[:garden_id])
    # 2. Create a plant instance with strong params
    @plant = Plant.new(plant_params)
    #3. Attach/assign the two instances together. A plant instance belongs to a garden instance
    # @plant.garden_id = @garden.id
    @plant.garden = @garden
    # 3. Save the plant instance
      if @plant.save
        redirect_to garden_path(@garden)
      else
        render :new
      end
  end

  def destroy
    #1.find the plant instance thanks to the parametric url
    plant = Plant.find(params[:id])
    # 2. destroy the plant instance
    plant.destroy
    #3. redirect the user
    redirect_to garden_path(plant.garden)
  end

  private

  def plant_params
    params.require(:plant).permit(:name, :image_url)
  end
end
