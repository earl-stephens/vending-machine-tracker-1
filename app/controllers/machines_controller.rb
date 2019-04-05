class MachinesController < ApplicationController
  def index
    @owner = Owner.find(params[:owner_id])
  end

  def show
    # binding.pry
    @machine = Machine.find(params[:id])
  end
end
