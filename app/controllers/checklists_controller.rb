class ChecklistsController < ApplicationController
  before_action :authenticate_user 

  def index
    @checklists = Checklist.all
    render json: {data: @checklists}
  end

  def create
    checklist = Checklist.create(name: params[:name])

    render json: {data: checklist}
  end

  def delete
    @checklist.destroy

    render json: {message: 'Deleted'}
  end

  private

  def set_checklist
    @checklist = Checklist.find(params[:id])
  end
end
