class ReceiversController < ApplicationController
  def index
    @receivers = policy_scope(Receiver)
  end
end
