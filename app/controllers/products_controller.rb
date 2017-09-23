class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  #skip_before_action :verify_authenticity_token
  # GET /products
  # GET /products.json
  def index
    @products = Product.where(business_id: @current_user).includes(:fine_prints, :purchase_options, :images_products, :target_customers).order("created_at DESC")
  end

  def archive_product
    product = Product.find(params[:id])
    product.status = 'archived'
    product.save
    render :json => {
      status:"archived"
    }
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    params[:product][:category_id] = params[:product][:category][:id]
    @product = Product.new(product_params)
    @product.business_id = @current_user
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Tag was successfully created.' }
        format.json { render :show, status: :created }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
#    @product = Product.create!(product_params)

#    if params[:has_requested_new_category]
#      @product.update_attributes(status:"pending_category_approval")
#    else
#      @product.update_attributes(status:"active")
#    end

#    if params[:fine_prints].present?
#      params[:fine_prints].each do |fine_print|
#        FinePrint.create!(:text=>fine_print,:product_id=>@product.id)
#      end
#    end

#    params[:purchaseOptions].each_with_index do |purchase_option,index|
#      PurchaseOption.create!(
#      product_id:@product.id,
#      name: purchase_option["name"],
#      redemption_qty: purchase_option["redemption_qty"],
#      min_price: purchase_option["min_price"],
#      retail_price: purchase_option["retail_price"],
#      max_per_person: purchase_option["max_per_person"],
#      quantity_available: purchase_option["quantity_available"],
#      sku: purchase_option["sku"])
#    end

#    params[:targetCustomers].each do |target_option|
#      if target_option["checked"]
#        new_target_customer = TargetCustomer.create!(gender:target_option["gender"] , min_age:target_option["minAge"] , max_age:target_option["maxAge"])
#        ProductsTargetCustomer.create!(product_id: @product.id, target_customer_id: new_target_customer.id)
#      end
#    end

#    if params[:image_associations].present?
#      params[:image_associations].each_with_index do |image,index|
#        if index == 0
#          ImagesProduct.create!(product_id: @product.id, image_id: image["image_id"], is_default: true)
#        else
#          ImagesProduct.create!(product_id: @product.id, image_id: image["image_id"], is_default: false)
#        end
#      end
#    end
#    if !@product.errors
#      status = "OK"
#    else
#      status = "unprocessable_entity"
#    end
#    render :json=> {
#      product: @product,
#      fine_prints:@product.fine_prints,
#      purchase_options:@product.purchase_options,
#      target_options:@product.target_customers,
#      images:@product.images_products,
#    }
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      params[:product][:category_id] = params[:product][:category][:id]
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:category_id, :business_id, :product_type_id, :title, :description, :show_discount, :gifting_enabled, :sharing_enabled, :mobile_call_enabled, :status, fine_prints_attributes: [:id, :text, :_destroy], purchase_options_attributes: [:id, :name, :redemption_qty, :sku, :min_price, :max_per_person, :retail_price, :quantity_available, :_destroy], products_target_customers_attributes: [:id, :product_id, :target_customer_id, :_destroy])
    end
end
