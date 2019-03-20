class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build(name: 'ingredient')
    @recipe.ingredients.build(quantity: '0 cups')
  end

  def create
    @recipe = Recipe.create(params.require(:recipe).permit(:title, ingredients_attributes: [:id, :name, :quantity]))
    redirect_to @recipe
  end


end
