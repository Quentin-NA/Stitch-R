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
  end

  def history
    @user = current_user
    @receipts = Receipt.where(status: 'new')
  end
end
