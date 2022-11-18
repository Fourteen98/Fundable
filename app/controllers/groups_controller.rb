class GroupsController < ApplicationController
  # before_action :authenticate_user!
  def index
    @groups = Group.where(author_id: current_user.id).order('created_at DESC')
    # get total amount of purchases for each group
    @total_amount = {}
    @groups.each do |group|
      @total_amount[group.name] = Purchase.joins(:group_purchases).where(group_purchases: { group_id: group.id }).where(author_id: current_user.id).sum(:amount)
    end
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.author_id = current_user.id
    if @group.save
      redirect_to groups_path
    else
      render :new
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
