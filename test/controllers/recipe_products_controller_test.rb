require 'test_helper'

class RecipeProductsControllerTest < ActionController::TestCase
  setup do
    @recipe_product = recipe_products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:recipe_products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create recipe_product" do
    assert_difference('RecipeProduct.count') do
      post :create, recipe_product: { product_id: @recipe_product.product_id, quantity: @recipe_product.quantity, recipe_id: @recipe_product.recipe_id }
    end

    assert_redirected_to recipe_product_path(assigns(:recipe_product))
  end

  test "should show recipe_product" do
    get :show, id: @recipe_product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @recipe_product
    assert_response :success
  end

  test "should update recipe_product" do
    patch :update, id: @recipe_product, recipe_product: { product_id: @recipe_product.product_id, quantity: @recipe_product.quantity, recipe_id: @recipe_product.recipe_id }
    assert_redirected_to recipe_product_path(assigns(:recipe_product))
  end

  test "should destroy recipe_product" do
    assert_difference('RecipeProduct.count', -1) do
      delete :destroy, id: @recipe_product
    end

    assert_redirected_to recipe_products_path
  end
end
