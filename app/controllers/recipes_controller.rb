class RecipesController < ApplicationController

before_filter :find_recipe, :only => [:show,
                                       :edit,
                                       :update,
                                       :destroy]



  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
  @recipe = Recipe.new(params[:recipe])
    if @recipe.save
      flash[:notice] = "Recipe has been created."
      redirect_to @recipe
    else
      flash[:alert] = "Recipe has not been created."
      render :action => "new"
    end
  end


  def show

  end

  def edit

  end

  def update

    if @recipe.update_attributes(params[:recipe])
      flash[:notice] = "Recipe has been updated."
      redirect_to @recipe
    else
      flash[:alert] = "Recipe has not been updated."
      render :action => "edit"
    end
  end

  def destroy

    @recipe.destroy
    flash[:notice] = "Recipe has been deleted."
    redirect_to recipes_path
  end


  private
  def find_recipe
    @recipe = Recipe.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The recipe you were looking" +
    " for could not be found."
    redirect_to recipes_path
  end





end
