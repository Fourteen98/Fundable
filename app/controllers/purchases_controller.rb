class PurchasesController < ApplicationController
  def index
    p params[:group_id]
    @group = Group.find_by(id: params[:group_id])
    @purchases = Purchase.joins(:group_purchases).where(group_purchases: { group_id: params[:group_id] }).where(author_id: current_user.id).order('created_at DESC')
    @total_amount = Purchase.joins(:group_purchases).where(group_purchases: { group_id: params[:group_id] }).where(author_id: current_user.id).sum(:amount)
      # Purchase.includes(:group_purchases).where(author_id: current_user.id, group_purchases: {group_id: params[:id]}).sum(:amount)
  end

  def new
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.new(purchase_params)
    @purchase.author_id = current_user.id
    if @purchase.save
      redirect_to purchases_path
    else
      render :new
    end
  end


  private

  def purchase_params
    params.require(:purchase).permit(:name, :amount)
  end
end
