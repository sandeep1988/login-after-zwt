class FollowuptypesController < ApplicationController
  before_action :set_followuptype, only: [:show, :edit, :update, :destroy]

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
  end

  # POST /followuptypes
  # POST /followuptypes.json
  def create
    @followuptype = Followuptype.new(followuptype_params)

    respond_to do |format|
      if @followuptype.save
        format.html { redirect_to @followuptype, notice: 'Followuptype was successfully created.' }
        format.json { render :show, status: :created, location: @followuptype }
      else
        format.html { render :new }
        format.json { render json: @followuptype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /followuptypes/1
  # PATCH/PUT /followuptypes/1.json
  def update
    respond_to do |format|
      if @followuptype.update(followuptype_params)
        format.html { redirect_to @followuptype, notice: 'Followuptype was successfully updated.' }
        format.json { render :show, status: :ok, location: @followuptype }
      else
        format.html { render :edit }
        format.json { render json: @followuptype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /followuptypes/1
  # DELETE /followuptypes/1.json
  def destroy
    @followuptype.destroy
    respond_to do |format|
      format.html { redirect_to followuptypes_url, notice: 'Followuptype was successfully destroyed.' }
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
      params[:followuptype]
    end
end
