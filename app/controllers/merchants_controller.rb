class MerchantsController < ApplicationController
  before_action :set_merchant, only: %i[ show edit update destroy ]

  # GET /merchants or /merchants.json
  def index
    unless params[:name_filter].blank?
      @merchants = Merchant.search_name params[:name_filter]
    else
      @merchants = Merchant.all
    end
    flash[:info] = "Signed in successfully."
  end

  # GET /merchants/1 or /merchants/1.json
  def show
  end

  # GET /merchants/new
  def new
    if current_merchant.role != 1
      redirect_to merchants_url, warning: "Don't have permissions"
    else
      @merchant = Merchant.new
    end

  end

  # GET /merchants/1/edit
  def edit
    if current_merchant.role != 1
      redirect_to merchants_url, warning: "Don't have permissions"
    end
  end

  # POST /merchants or /merchants.json
  def create
    @merchant = Merchant.new(merchant_params)
    respond_to do |format|
      if @merchant.save
        format.html { redirect_to @merchant, notice: "Merchant was successfully created." }
        format.json { render :show, status: :created, location: @merchant }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @merchant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /merchants/1 or /merchants/1.json
  def update
    if current_merchant.role == 1
      respond_to do |format|
        if @merchant.update_without_password(merchant_params)
          format.html { redirect_to @merchant, notice: "Merchant was successfully updated." }
          format.json { render :show, status: :ok, location: @merchant }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @merchant.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to merchants_url, warning: "Don't have permissions"
    end
  end

  # DELETE /merchants/1 or /merchants/1.json
  def destroy
    if current_merchant.role == 1
      @merchant.destroy
      respond_to do |format|
        format.html { redirect_to merchants_url, notice: "Merchant was successfully destroyed." }
        format.json { head :no_content }
      end
    else
      redirect_to merchants_url, warning: "Don't have permissions"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_merchant
      @merchant = Merchant.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def merchant_params
      params.require(:merchant).permit(:email, :name, :city, :street, :country_code, :extra, :phone_number, :website, :role, :password)
    end
end
