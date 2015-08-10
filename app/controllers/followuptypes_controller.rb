class FollowuptypesController < ApplicationController
  before_action :set_followuptype, only: [:show, :edit, :update, :destroy]
  respond_to :html, :js, :json
  # GET /followuptypes
  # GET /followuptypes.json
  def index
    @followuptypes = Followuptype.all
  end

  # GET /followuptypes/1
  # GET /followuptypes/1.json
  def show
  end

  # GET /followuptypes/new
  def new
    @followuptype = Followuptype.new
  end

  # GET /followuptypes/1/edit
  def edit
    @followuptype = Followuptype.find(params[:id])
    @followuptype.update_attributes(v_title: params[:v_title], v_color: params[:v_color], updated_at:Time.now)
    redirect_to followuptypes_path
  end

  # POST /followuptypes
  # POST /followuptypes.json
  def create
    @followuptype = Followuptype.new(followuptype_params)
      if @followuptype.save
        redirect_to followuptypes_path
      else
        render action: 'new'
      end
  end

  # PATCH/PUT /followuptypes/1
  # PATCH/PUT /followuptypes/1.json
  def update
    @followuptype = Followuptype.find(params[:id])
    respond_to do |format|
      if @followuptype.update(followuptype_params)
        format.html { redirect_to followuptypes_path, notice: 'Followuptype was successfully updated.' }
        format.json
        format.js
      else
        format.js
        format.html { render :edit }
        format.json 
      end
    end
  end

  # DELETE /followuptypes/1
  # DELETE /followuptypes/1.json
  def destroy
    @followuptype = Followuptype.find(params[:id])
    @followuptype.destroy
    respond_to do |format|
      format.html { redirect_to followuptypes_url, notice: 'Followuptype was successfully destroyed.' }
       format.js
      format.json { head :no_content }
     end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_followuptype
      @followuptype = Followuptype.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def followuptype_params
      params.require(:followuptype).permit(:v_title, :v_color)
    end
end
