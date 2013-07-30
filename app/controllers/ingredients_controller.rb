class IngredientsController < ApplicationController

before_filter :find_recipe
before_filter :find_ingredient, :only => [:show, :edit, :update, :destroy]

  def new
    @ingredient = @recipe.ingredients.build
  end

  def create
    @ingredient = @recipe.ingredients.build(params[:ingredient])
    if @ingredient.save
      flash[:notice] = "Ingredient has been created."
      redirect_to [@recipe, @ingredient]
    else
      flash[:alert] = "Ingredient has not been created."
      render :action => "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @ingredient.update_attributes(params[:ingredient])
      flash[:notice] = "Ingredient has been updated."
      redirect_to [@recipe, @ingredient]
    else
      flash[:alert] = "Ingredient has not been updated."
      render :action => "edit"
    end
  end

  def destroy
    @ingredient.destroy
    flash[:notice] = "Ingredient has been deleted."
    redirect_to @recipe
  end


  private
  def find_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def find_ingredient
    @ingredient = @recipe.ingredients.find(params[:id])
  end
end

