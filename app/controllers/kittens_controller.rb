class KittensController < ApplicationController
  def index
    @kittens = Kittens.ApplicationController
  end

  def show
    @kitten = Kitten.find(params[:id])
  end
  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      flash[:notice] = "Kitten created successfully!"
      redirect_to @kitten
    else
      flash.now[:alert] = "Failed to create kitten."
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def update
    @kitten = Kitten.find(params[:id])

    if @kitten.update(kitten_params)
      flash[:notice] = "Kitten updated successfully!"
      redirect_to @kitten
    else
      flash.now[:alert] = "Failed to update kitten."
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @kitten = Kitten.find(params[:id])
    @kitten.destroy

    flash[:notice] = "Kitten deleted successfully!"
    redirect_to kittens_path, status: :see_other
  end

  private

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end
