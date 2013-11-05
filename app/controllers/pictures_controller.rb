class PicturesController < ApplicationController
    def index
  
    end
  
    def show
      
    end
  
    def new
      
    end
  
    def create
      
    end
  
    def edit
      
    end
  
    def update
      
    end
  
    def destroy
      
    end

    private
    def picture_param
      params.require(:picture).picture(:title, :author, :url)
    end
end
