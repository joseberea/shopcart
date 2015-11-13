class RecipeProductsController < ApplicationController
  before_action :set_recipe_product, only: [:show, :edit, :update, :destroy]

  # GET /recipe_products
  # GET /recipe_products.json
  def index
    @recipe_products = RecipeProduct.all
  end

  # GET /recipe_products/1
  # GET /recipe_products/1.json
  def show
  end

  # GET /recipe_products/new
  def new
    @recipe_product = RecipeProduct.new
    @products = Product.all
    @recipes = Recipe.all
  end

  # GET /recipe_products/1/edit
  def edit
  end

  # POST /recipe_products
  # POST /recipe_products.json
  def create
    @recipe_product = RecipeProduct.new(recipe_product_params)

    respond_to do |format|
      if @recipe_product.save
        format.html { redirect_to @recipe_product, notice: 'Recipe product was successfully created.' }
        format.json { render :show, status: :created, location: @recipe_product }
      else
        format.html { render :new }
        format.json { render json: @recipe_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipe_products/1
  # PATCH/PUT /recipe_products/1.json
  def update
    respond_to do |format|
      if @recipe_product.update(recipe_product_params)
        format.html { redirect_to @recipe_product, notice: 'Recipe product was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe_product }
      else
        format.html { render :edit }
        format.json { render json: @recipe_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipe_products/1
  # DELETE /recipe_products/1.json
  def destroy
    @recipe_product.destroy
    respond_to do |format|
      format.html { redirect_to recipe_products_url, notice: 'Recipe product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe_product
      @recipe_product = RecipeProduct.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_product_params
      params.require(:recipe_product).permit(:recipe_id, :product_id, :quantity)
    end
end
