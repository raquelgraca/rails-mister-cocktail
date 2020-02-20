class DosesController < ApplicationController
  def show
    @dose = Dose.find(params[:id])
  end

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    # we need `restaurant_id` to associate dose with corresponding cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    @dose.save
    redirect_to restaurant_path(@cocktail)
  end

  def destroy
    @dose = Dose.destroy
  end

  private

  def dose_params
    params.require(:dose).permit(:description)
  end
end
