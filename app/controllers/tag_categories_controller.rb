class TagCategoriesController < ApplicationController
  before_action :set_tag_category, only: [:show, :edit, :update, :destroy]

  # GET /tag_categories
  # GET /tag_categories.json
  def index
    @tag_categories = TagCategory.all
  end

  # GET /tag_categories/1
  # GET /tag_categories/1.json
  def show
  end

  # GET /tag_categories/new
  def new
    @tag_category = TagCategory.new
  end

  # GET /tag_categories/1/edit
  def edit
  end

  # POST /tag_categories
  # POST /tag_categories.json
  def create
    @tag_category = TagCategory.new(tag_category_params)

    respond_to do |format|
      if @tag_category.save
        format.html { redirect_to @tag_category, notice: 'Tag category was successfully created.' }
        format.json { render :show, status: :created, location: @tag_category }
      else
        format.html { render :new }
        format.json { render json: @tag_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tag_categories/1
  # PATCH/PUT /tag_categories/1.json
  def update
    respond_to do |format|
      if @tag_category.update(tag_category_params)
        format.html { redirect_to @tag_category, notice: 'Tag category was successfully updated.' }
        format.json { render :show, status: :ok, location: @tag_category }
      else
        format.html { render :edit }
        format.json { render json: @tag_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tag_categories/1
  # DELETE /tag_categories/1.json
  def destroy
    @tag_category.destroy
    respond_to do |format|
      format.html { redirect_to tag_categories_url, notice: 'Tag category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag_category
      @tag_category = TagCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tag_category_params
      params.require(:tag_category).permit(:name)
    end
end
