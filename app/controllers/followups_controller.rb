class FollowupsController < ApplicationController
  before_action :set_followup, only: [:show, :edit, :update, :destroy]

  # GET /followups
  # GET /followups.json
  def index
    redirect_to contacts_path
    @followups = Followup.all
  end

  # GET /followups/1
  # GET /followups/1.json
  def show
    redirect_to contacts_path
  end

  # GET /followups/new
  def new
    @followup = Followup.new
  end

  # GET /followups/1/edit
  def edit
  end

  # POST /followups
  # POST /followups.json
  def create
    @followup = Followup.new(followup_params)
    @followup.next_followed_up_by = params[:next_followed_up_by]
    @followup.contact_id = Contact.find_by_id(session[:contact_id]).id
    @followup.followed_up_by = Contact.find_by_id(session[:contact_id]).user.id
    # @followup.case_id = Case.find_by_id(session[:case_id]).contact.id
      if @followup.save
        redirect_to contacts_path
      else
        render action: 'contacts/show'
      end
    end

  # PATCH/PUT /followups/1
  # PATCH/PUT /followups/1.json
  def update
    respond_to do |format|
      if @followup.update(followup_params)
        format.html { redirect_to @followup, notice: 'Followup was successfully updated.' }
        format.json { render :show, status: :ok, location: @followup }
      else
        format.html { render :edit }
        format.json { render json: @followup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /followups/1
  # DELETE /followups/1.json
  def destroy
    @followup.destroy
    respond_to do |format|
      format.html { redirect_to followups_url, notice: 'Followup was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_followup
      @followup = Followup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def followup_params
      params.require(:followup).permit(:contact_id, :case_id, :followed_up_date, :followed_up_type_id, :followed_up_by, :v_outcome, :d_next_followed_up_date, :next_followed_up_type_id, :next_followed_up_by)
    end
end
