# app/controllers/products_controller.rb
class ProductsController < ApplicationController
    before_action :set_product, only: [:show, :update, :destroy]
  
    # GET /products
    def index
      @products = Product.all
      #render json: @products, each_serializer: ProductsSerializer
      render json: {
        data: ActiveModelSerializers::SerializableResource.new(@products, each_serializer: ProductsSerializer),
        message: ['Products list fetched successfully'],
        status: 200,
        type: 'Success'
      }.to_json
    end
  
    # GET /products/1
    def show
        render json: {
            data: ActiveModelSerializers::SerializableResource.new(@products, each_serializer: ProductsSerializer),
            message: ['Products list fetched successfully'],
            status: 200,
            type: 'Success'
          }.to_json
    end
  
    # POST /products
    def create
      @product = Product.new(product_params)
  
      if @product.save
        render json: {
        data: ActiveModelSerializers::SerializableResource.new(@products, each_serializer: ProductsSerializer),
        message: ['Products list fetched successfully'],
        status: 200,
        type: 'Success'
      }.to_json
      else
        render json: @product.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /products/1
    def update
      if @product.update(product_params)
        render json: {
        data: ActiveModelSerializers::SerializableResource.new(@products, each_serializer: ProductsSerializer),
        message: ['Products list fetched successfully'],
        status: 200,
        type: 'Success'
      }.to_json
      else
        render json: @product.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /products/1
    def destroy
      @product.destroy
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_product
        @product = Product.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def product_params
        params.require(:product).permit(:name, :price)
      end
  end
  