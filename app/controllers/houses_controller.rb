class HousesController < ApplicationController
  before_action :set_house, only: [:show, :update, :destroy]

  # GET /houses
  def index
    @user= User.find_by(id: params[:user_id])
    @houses = @user.houses

    render json: @houses
  end

  # GET /houses/1
  def show
    render json: @house
  end

  # POST /houses
  def create

    @house = House.new(house_params)
    @house.user_id = params[:user_id]


    if @house.save
      render json: @house, status: :created, location: @house
    else
      render json: @house.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /houses/1
  def update
    if @house.update(house_params)
      render json: @house
    else
      render json: @house.errors, status: :unprocessable_entity
    end
  end

  # DELETE /houses/1
  def destroy
    @house.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_house
      @house = House.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def house_params
      params.require(:house).permit(:state, :city, :address, :number_of_tenants)
    end
end
