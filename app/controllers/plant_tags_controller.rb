class PlantTagsController < ApplicationController

  def new
    @plant_tag = PlantTag.new
    @plant = Plant.find(params[:plant_id])
  end


  # Create method to build one PlantTag at a time
    # def create
    #   @plant_tag = PlantTag.new(plant_tag_params)
    #   @plant = Plant.find(params[:plant_id]) # INFORMATION FROM THE URL

    #   @plant_tag.plant = @plant

    #   if @plant_tag.save
    #     redirect_to @plant.garden
    #   else
    #     render :new
    #   end
    # end

  # Create method to build multiple PlantTags at a time
    def create
      @plant = Plant.find(params[:plant_id])
      @tags = Tag.where(id: params[:plant_tag][:tag])

      @tags.each do |tag|
        @plant_tag = PlantTag.create(plant: @plant, tag: tag)
      end

      redirect_to @plant.garden
    end

  private

  def plant_tag_params # INFORMATION PROVIDED WITH THE FORM
    params.require(:plant_tag).permit(:tag_id)
  end
end
