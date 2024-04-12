class UsersController < ApplicationController
    before_action :set_product, only: [:show, :update, :destroy]
  
    # GET /products
    def index
      @users = User.all
      render json: {
        data: ActiveModelSerializers::SerializableResource.new(@users, each_serializer: UsersSerializer),
        message: ['Users list fetched successfully'],
        status: 200,
        type: 'Success'
      }.to_json
    end
  
    # GET /products/1
    def show
        render json: {
            data: ActiveModelSerializers::SerializableResource.new(@user, each_serializer: UsersSerializer),
            message: ['Users list fetched successfully'],
            status: 200,
            type: 'Success'
          }.to_json
    end
  
    # POST /products
    def create
      @user = User.new(user_name)
  
      if @user.save
        render json: {
            data: ActiveModelSerializers::SerializableResource.new(@user, each_serializer: UsersSerializer),
            message: ['Users list fetched successfully'],
            status: 200,
            type: 'Success'
          }.to_json
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /products/1
    def update
      if @user.update(user_name)
        render json: {
        data: ActiveModelSerializers::SerializableResource.new(@user, each_serializer: UsersSerializer),
        message: ['Users list fetched successfully'],
        status: 200,
        type: 'Success'
      }.to_json
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /products/1
    def destroy
      @user.destroy
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_product
        @user = User.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def product_params
        params.require(:user).permit(:name)
      end
  
end
