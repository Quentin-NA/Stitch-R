require 'date'

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    @user = current_user
  end

  def profil
    @user = current_user
    @receivers = Receiver.all
  end

  def history
    @user = current_user
    @receipts = Receipt.where(status: 'shared', user_id: current_user)
  end

  def trash
    @user = current_user
    @receipts = Receipt.where(status: 'dismissed', user_id: current_user)
  end

  def mailbox_scanning
  end

end
