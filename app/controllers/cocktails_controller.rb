class CocktailsController < ApplicationController
   def index
    @cocktails = Cocktail.all
    end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    # Will raise ActiveModel::ForbiddenAttributesError
    if @cocktail.save
     redirect_to cocktail_path(@cocktail)
    #else re render new form
    else
      render 'new'
    end
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end
