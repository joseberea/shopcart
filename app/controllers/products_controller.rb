class ProductsController < ApplicationController
    # List submit
    def index
        @products = Product.all
    end
    
    # Show submit
    def show
        @product = Product.find(params[:id])
    end

    # Add handler
    def new
    end
    
    # Add submit
    def create
        @product = Product.new(product_params)
        @product.save
        #redirect_to @product
        #redirect_to product_path(id: @product.id)
        redirect_to products_path
    end
    
    # Edit handler
    def edit
        @product = Product.find(params[:id])
    end
    
    # Edit submit
    def update
        @product = Product.find(params[:id])
        if @product.update(product_params)
            redirect_to products_path
        else    
            render 'edit'
        end
    end
    
    # Delete submit
    def destroy
        redirect_to new_product_path
    end
    
    # PRIVATE METHODS
    private
      def product_params
        params.require(:product).permit(:name, :description)
      end    
end
