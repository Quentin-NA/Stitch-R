class ReceiversController < ApplicationController
  def index
    @receivers = policy_scope(Receiver.where(user_id: current_user))
    @user = current_user
  end

  def show
    @supplier_search = SupplierSearch.find(params[:id])
    StoreSupplierSearchReceipts.new(current_user, @supplier_search).call
    @receipts = Receipt.where(supplier_search_id: params[:id]).where(status: "new", user_id: current_user)
    authorize @supplier_search
  end

  def new
    @user = current_user
    @receiver = Receiver.new
    authorize @receiver
  end

  def create
    @receiver = Receiver.new(receiver_params)
    @receiver.image = "logos/#{@receiver.name.downcase}.png"
    @receiver.user = current_user
    authorize @receiver
    if @receiver.save
      redirect_to supplier_searches_path
    else
      render :new
    end
  end

  def update
    @receiver = Receiver.find(params[:id])
    @receiver.update(receiver_params)
    authorize @receiver
    redirect_to profil_path
  end

  def destroy
    @receiver = Receiver.find(params[:id])
    authorize @receiver
    @receiver.destroy
    redirect_to profil_path
  end

  private

  def receiver_params
    params.require(:receiver).permit(:email, :name)
  end


end
