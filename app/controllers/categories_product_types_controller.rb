class CategoriesProductTypesController < ApplicationController
  before_action :set_categories_product_type, only: [:show, :edit, :update, :destroy]

  # GET /categories_product_types
  # GET /categories_product_types.json
  def index
    @categories_product_types = CategoriesProductType.all
  end

  # GET /categories_product_types/1
  # GET /categories_product_types/1.json
  def show
  end

  # GET /categories_product_types/new
  def new
    @categories_product_type = CategoriesProductType.new
  end

  # GET /categories_product_types/1/edit
  def edit
  end

  # POST /categories_product_types
  # POST /categories_product_types.json
  def create
    @categories_product_type = CategoriesProductType.new(categories_product_type_params)

    respond_to do |format|
      if @categories_product_type.save
        format.html { redirect_to @categories_product_type, notice: 'Categories product type was successfully created.' }
        format.json { render :show, status: :created, location: @categories_product_type }
      else
        format.html { render :new }
        format.json { render json: @categories_product_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories_product_types/1
  # PATCH/PUT /categories_product_types/1.json
  def update
    respond_to do |format|
      if @categories_product_type.update(categories_product_type_params)
        format.html { redirect_to @categories_product_type, notice: 'Categories product type was successfully updated.' }
        format.json { render :show, status: :ok, location: @categories_product_type }
      else
        format.html { render :edit }
        format.json { render json: @categories_product_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories_product_types/1
  # DELETE /categories_product_types/1.json
  def destroy
    @categories_product_type.destroy
    respond_to do |format|
      format.html { redirect_to categories_product_types_url, notice: 'Categories product type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_categories_product_type
      @categories_product_type = CategoriesProductType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def categories_product_type_params
      params.require(:categories_product_type).permit(:category_id, :product_type_id)
    end
end
