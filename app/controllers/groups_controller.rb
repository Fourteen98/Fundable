class GroupsController < ApplicationController
  # before_action :authenticate_user!
  def index
    @groups = Group.where(author_id: current_user.id).order('created_at DESC')
  end

  def new; end
end
