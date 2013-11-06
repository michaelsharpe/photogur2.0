class PicturesController < ApplicationController
    def index
      @pictures = Picture.all 
    end
  
    def show
      @picture = Picture.find(params[:id])
    end
  
    def new
      @picture = Picture.new
      @disable_right_side = true
    end
  
    def create
      @picture = Picture.new picture_params

      @picture.save

      redirect_to pictures_path
    end
  
    def edit
      @picture = Picture.find(params[:id])
    end
  
    def update
      @picture = Picture.find(params[:id])
      @picture.update_attributes(picture_params)
      @picture.save

      redirect_to @picture
    end
  
    def destroy
      @picture = Picture.find(params[:id])
      @picture.destroy

      redirect_to pictures_path
    end

    private
    def picture_params
      params.require(:picture).permit(:title, :author, :url)
    end
end
