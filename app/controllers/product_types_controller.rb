class ProductTypesController < ApplicationController
  before_action :set_product_type, only: [:show, :edit, :update, :destroy]

  def index
    @product_types = ProductType.all
    authorize ProductType
  end

  def show
  end

  def create
    @product_type = ProductType.new(product_type_params)
    authorize @product_type
    respond_to do |format|
      if @product_type.save
        format.json { render :show, status: :created, location: @product_type }
      else
        format.json { render json: @product_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product_type.update(product_type_params)
        format.json { render :show, status: :ok, location: @product_type }
      else
        format.json { render json: @product_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product_type.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_type
      @product_type = ProductType.find(params[:id])
      authorize @product_type
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_type_params
      params.require(:product_type).permit(:name, :status)
    end
end
