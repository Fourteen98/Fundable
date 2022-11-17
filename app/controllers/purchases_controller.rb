class PurchasesController < ApplicationController
  def index
    @purchases = GroupPurchase.where(group_id: params[:group_id])
  end

  def new
  end

  def create
  end
end
