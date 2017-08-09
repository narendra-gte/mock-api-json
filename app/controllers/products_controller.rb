class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  #skip_before_action :verify_authenticity_token
  # GET /products
  # GET /products.json
  def index
    @products = Product.where(business_id: @current_user).includes(:fine_prints).order("created_at DESC")
    authorize Product
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = authorize Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = authorize Product.create!(product_params)
    params[:product][:fine_prints].each do |fine_print|
      FinePrint.create!(:text=>fine_print,:product_id=>@product.id)
    end

    params[:product][:purchaseOptions].each_with_index do |purchase_option,index|
       PurchaseOption.create!(
        product_id:@product.id,
        name: purchase_option["name"],
        redemption_qty: purchase_option["redemption_qty"],
        min_price: purchase_option["min_price"],
        retail_price: purchase_option["retail_price"],
        max_per_person: purchase_option["max_per_person"],
        quantity_available: purchase_option["quantity_available"],
        sku: purchase_option["sku"])
    end

    params[:product][:targetCustomers].each do |target_option|
      if target_option["checked"]
          new_target_customer = TargetCustomer.create!(gender:target_option["gender"] , min_age:target_option["minAge"] , max_age:target_option["maxAge"])
          ProductsTargetCustomer.create!(product_id: @product.id, target_customer_id: new_target_customer.id)
      end
    end

    params[:product][:image_associations].each_with_index do |image,index|
      if index == 0
        ImagesProduct.create!(product_id: @product.id, image_id: image["image_id"], is_default: true)
      else
        ImagesProduct.create!(product_id: @product.id, image_id: image["image_id"], is_default: false)
      end
    end
    if !@product.errors
      status = "OK"
    else
      status = "unprocessable_entity"
    end
    render :json=> {
      product: @product,
      fine_prints:@product.fine_prints,
      purchase_options:@product.purchase_options,
      target_options:@product.target_customers,
      images:@product.images_products,
    }
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = authorize Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:category_id, :business_id, :title, :description, :show_discount, :gifting_enabled, :sharing_enabled, :mobile_call_enabled)
    end
end
