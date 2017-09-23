class ImagesTagsController < ApplicationController
  before_action :set_images_tag, only: [:show, :edit, :update, :destroy]

  # GET /images_tags
  # GET /images_tags.json
  def index
    @images_tags = ImagesTag.all
  end

  # GET /images_tags/1
  # GET /images_tags/1.json
  def show
  end

  # GET /images_tags/new
  def new
    @images_tag = ImagesTag.new
  end

  # GET /images_tags/1/edit
  def edit
  end

  # POST /images_tags
  # POST /images_tags.json
  def create
    @images_tag = ImagesTag.new(images_tag_params)

    respond_to do |format|
      if @images_tag.save
        format.html { redirect_to @images_tag, notice: 'Images tag was successfully created.' }
        format.json { render :show, status: :created, location: @images_tag }
      else
        format.html { render :new }
        format.json { render json: @images_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /images_tags/1
  # PATCH/PUT /images_tags/1.json
  def update
    respond_to do |format|
      if @images_tag.update(images_tag_params)
        format.html { redirect_to @images_tag, notice: 'Images tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @images_tag }
      else
        format.html { render :edit }
        format.json { render json: @images_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /images_tags/1
  # DELETE /images_tags/1.json
  def destroy
    @images_tag.destroy
    respond_to do |format|
      format.html { redirect_to images_tags_url, notice: 'Images tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_images_tag
      @images_tag = ImagesTag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def images_tag_params
      params.fetch(:images_tag, {})
    end
end
