class PurchaseOptionsController < ApplicationController
  before_action :set_purchase_option, only: [:show, :edit, :update, :destroy]

  # GET /purchase_options
  # GET /purchase_options.json
  def index
    @purchase_options = PurchaseOption.all
  end

  # GET /purchase_options/1
  # GET /purchase_options/1.json
  def show
  end

  # GET /purchase_options/new
  def new
    @purchase_option = PurchaseOption.new
  end

  # GET /purchase_options/1/edit
  def edit
  end

  # POST /purchase_options
  # POST /purchase_options.json
  def create
    @purchase_option = PurchaseOption.new(purchase_option_params)

    respond_to do |format|
      if @purchase_option.save
        format.html { redirect_to @purchase_option, notice: 'Purchase option was successfully created.' }
        format.json { render :show, status: :created, location: @purchase_option }
      else
        format.html { render :new }
        format.json { render json: @purchase_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purchase_options/1
  # PATCH/PUT /purchase_options/1.json
  def update
    respond_to do |format|
      if @purchase_option.update(purchase_option_params)
        format.html { redirect_to @purchase_option, notice: 'Purchase option was successfully updated.' }
        format.json { render :show, status: :ok, location: @purchase_option }
      else
        format.html { render :edit }
        format.json { render json: @purchase_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchase_options/1
  # DELETE /purchase_options/1.json
  def destroy
    @purchase_option.destroy
    respond_to do |format|
      format.html { redirect_to purchase_options_url, notice: 'Purchase option was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase_option
      @purchase_option = PurchaseOption.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def purchase_option_params
      params.require(:purchase_option).permit(:product_id, :name, :redemption_qty, :min_price, :retail_price, :max_per_person, :quantity_available, :sku)
    end
end
