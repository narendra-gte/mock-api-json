class FinePrintsController < ApplicationController
  before_action :set_fine_print, only: [:show, :edit, :update, :destroy]

  # GET /fine_prints
  # GET /fine_prints.json
  def index
    @fine_prints = FinePrint.all
  end

  # GET /fine_prints/1
  # GET /fine_prints/1.json
  def show
  end

  # GET /fine_prints/new
  def new
    @fine_print = FinePrint.new
  end

  # GET /fine_prints/1/edit
  def edit
  end

  # POST /fine_prints
  # POST /fine_prints.json
  def create
    @fine_print = FinePrint.new(fine_print_params)

    respond_to do |format|
      if @fine_print.save
        format.html { redirect_to @fine_print, notice: 'Fine print was successfully created.' }
        format.json { render :show, status: :created, location: @fine_print }
      else
        format.html { render :new }
        format.json { render json: @fine_print.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fine_prints/1
  # PATCH/PUT /fine_prints/1.json
  def update
    respond_to do |format|
      if @fine_print.update(fine_print_params)
        format.html { redirect_to @fine_print, notice: 'Fine print was successfully updated.' }
        format.json { render :show, status: :ok, location: @fine_print }
      else
        format.html { render :edit }
        format.json { render json: @fine_print.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fine_prints/1
  # DELETE /fine_prints/1.json
  def destroy
    @fine_print.destroy
    respond_to do |format|
      format.html { redirect_to fine_prints_url, notice: 'Fine print was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fine_print
      @fine_print = FinePrint.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fine_print_params
      params.require(:fine_print).permit(:product_id, :text)
    end
end
