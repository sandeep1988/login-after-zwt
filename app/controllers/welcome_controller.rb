class WelcomeController < ApplicationController
  def index
  end
  def forget_password_developer
  end
  def edit_user
  end
  def table_ajax
  end
   private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale
      @sale = Sale.find(params[:id])
    end
end