class PicturesController < ApplicationController
    def index
      @pictures = Picture.all 
    end
  
    def show
      
    end
  
    def new
      @picture = Picture.new
    end
  
    def create
      @picture = Picture.new picture_params

      @picture.save

      redirect_to pictures_path
    end
  
    def edit
      
    end
  
    def update
      
    end
  
    def destroy
      
    end

    private
    def picture_params
      params.require(:picture).permit(:title, :author, :url)
    end
end
