class RecipesController < ApplicationController
    # List submit
    def index
        @recipes = Recipe.all
    end
    
    # Show submit
    def show
        @recipe = Recipe.find(params[:id])
    end

    # Add handler
    def new
    end
    
    # Add submit
    def create
        @recipe = Recipe.new(recipe_params)
        @recipe.save
        #redirect_to @recipe
        #redirect_to recipe_path(id: @recipe.id)
        redirect_to recipes_path
    end
    
    # Edit handler
    def edit
        @recipe = Recipe.find(params[:id])
    end
    
    # Edit submit
    def update
        @recipe = Recipe.find(params[:id])
        if @recipe.update(recipe_params)
            redirect_to recipes_path
        else    
            render 'edit'
        end
    end
    
    # Delete submit
    def destroy
        @recipe = Recipe.find(params[:id])
        @recipe.destroy
        redirect_to recipes_path
    end
    
    # PRIVATE METHODS
    private
      def recipe_params
        params.require(:recipe).permit(:name, :description)
      end    
end
