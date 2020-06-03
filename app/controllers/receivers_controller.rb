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
    @receiver.user = current_user
    if @receiver.save
      redirect_to supplier_searches_path
    else
      render :new
    end
    authorize @receiver
  end

  def destroy
    @receiver = Receiver.find(params[:id])
    @receiver.destroy
    redirect_to receivers_path
    authorize @receiver
  end

  private

  def receiver_params
    params.require(:receiver).permit(:email, :name)
  end


end
