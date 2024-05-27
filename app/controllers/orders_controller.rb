class OrdersController < ApplicationController
    before_action :set_product, only: [:show, :update, :destroy]
  
    # GET /products
    def index
      @orders = Order.all
      render json: {
        data: ActiveModelSerializers::SerializableResource.new(@orders, each_serializer: OrdersSerializer),
        message: ['Orders list fetched successfully'],
        status: 200,
        type: 'Success'
      }.to_json
    end
  
    # GET /products/1
    def show
        render json: {
            data: ActiveModelSerializers::SerializableResource.new(@order, each_serializer: OrdersSerializer),
            message: ['Orders list fetched successfully'],
            status: 200,
            type: 'Success'
          }.to_json
    end
  
    # POST /products
    def create
      @order = Order.new(user_id,product_id,product_quantity)
  
      if @order.save
        render json: {
        data: ActiveModelSerializers::SerializableResource.new(@order, each_serializer: OrdersSerializer),
        message: ['Orders list fetched successfully'],
        status: 200,
        type: 'Success'
      }.to_json
      else
        render json: @order.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /products/1
    def update
      if @order.update(user_id,product_id,product_quantity)
        render json: {
        data: ActiveModelSerializers::SerializableResource.new(@order, each_serializer: OrdersSerializer),
        message: ['Products list fetched successfully'],
        status: 200,
        type: 'Success'
      }.to_json
      else
        render json: @order.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /products/1
    def destroy
      @order.destroy
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_product
        @order = Order.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def product_params
        params.require(:order).permit(:id)
      end
end
