class SnacksController < ApplicationController


def show
  # binding.pry
  @snack = Snack.find(params[:id])
end

end
