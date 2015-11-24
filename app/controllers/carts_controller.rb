class CartsController < ApplicationController
    # List submit
    def index
        @carts = Cart.all
    end
    
    # Show submit
    def show
        @cart = Cart.find(params[:id])
    end

    # Add handler
    def new
    end
    
    # Add submit
    def create
        @cart = Cart.new(cart_params)
        @cart.date = Time.new.inspect
        @cart.status = 'open'
        @cart.save
        redirect_to carts_path
    end
    
    # Edit handler
    def edit
        @cart = Cart.find(params[:id])
    end
    
    # Edit submit
    def update
        @cart = Cart.find(params[:id])
        if @cart.update(cart_params)
            redirect_to carts_path
        else    
            render 'edit'
        end
    end
    
    # Delete submit
    def destroy
        @cart = Cart.find(params[:id])
        @cart.destroy
        redirect_to carts_path
    end
    
    # Open submit
    def open
        @cart = Cart.find(params[:id])
        @cart.update_attributes(:status => 'open')
        redirect_to carts_path
    end
    
    # Close submit
    def close
        @cart = Cart.find(params[:id])
        @cart.update_attributes(:status => 'closed')
        redirect_to carts_path
    end
    
    #add cart products handler
    def add_products
        @products = Product.all
        @cart = Cart.find(params[:id])
        @cart_products = Product.joins(:cart_products).where("cart_products.cart_id = ?", @cart.id)
    end
    
    #add cart products submit
    def add_products_submit
        @product = Product.find(params[:id])
        @cart = Cart.find(params[:c])
        @cart_product = CartProduct.new
        @cart_product.cart_id = @cart.id
        @cart_product.product_id = @product.id
        @cart_product.save
        redirect_to carts_path
    end
    
    # PRIVATE METHODS
    private
      def cart_params
        params.require(:cart).permit(:name, :description, :date, :status)
      end   

end
