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
    
    # PRIVATE METHODS
    private
      def cart_params
        params.require(:cart).permit(:name, :description, :date, :status)
      end    
end
