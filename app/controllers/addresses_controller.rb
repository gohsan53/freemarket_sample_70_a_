class AddressesController < ApplicationController
  def edit
    @user = User.find(current_user.id)
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id]) 
    @address.update(address_params)
    if @address.update(address_params)
      redirect_to user_path(current_user.id), notice: '発送元・送付先住所を変更しました'
    else
      render :edit and return
    end
  end

  private
  def address_params
    params.require(:address).permit(:dest_first_name, :dest_last_name, :dest_first_name_kana, :dest_last_name_kana, :zip_code, :prefecture, :city, :block_number, :building, :telephone, :user_id)
  end

end
