class PurchasesController < ApplicationController
  def index
    @group = Group.find_by(id: params[:group_id])
    @purchases = Purchase.joins(:group_purchases).where(group_purchases: { group_id: params[:group_id] })
      .where(author_id: current_user.id).order('created_at DESC')
    @total_amount = Purchase.joins(:group_purchases).where(group_purchases: { group_id: params[:group_id] })
      .where(author_id: current_user.id).sum(:amount)
  end

  def new
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.new(name: params[:name], amount: params[:amount], author_id: current_user.id)

    if @purchase.save!
      params[:group_ids].each do |group_id|
        GroupPurchase.create(group_id: group_id, purchase_id: @purchase.id) if group_id != ''
      end
      redirect_to group_purchases_path
    else
      render :new
    end
  end

  private

  def purchase_params
    params.require(:purchase).permit(:name, :amount, :group_ids)
  end
end
