class FollowupsController < ApplicationController
  before_action :set_followup, only: [:show, :edit, :update, :destroy]

  # GET /followups
  # GET /followups.json
  def index
    if params[:option] == "phone"
      @followups = Followup.where(:next_followed_up_type_id => 1)
      render :layout => false  
    elsif 
      params[:option] == "skype"
      @followups = Followup.where(:next_followed_up_type_id => 2)
      render :layout => false  
    elsif 
      params[:option] == "email"
      @followups = Followup.where(:next_followed_up_type_id => 3)
      render :layout => false  
    elsif 
      params[:option] == "socialmedia"
      @followups = Followup.where(:next_followed_up_type_id => 4)
      render :layout => false  
    elsif 
      params[:option] == "all"
      @followups = Followup.all
      render :layout => false 
    else
      @followups = Followup.all
    end
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
    if request.referer.include? "?cases"
        @followup.case_id = Case.find_by_id(session[:case_id]).id
        @followup.followed_up_by = Case.find_by_id(session[:case_id]).user.id
        @followup.e_status = "case"
        if @followup.save
          redirect_to case_path(session[:case_id])
        end
    else 
      @followup.contact_id = Contact.find_by_id(session[:contact_id]).id
      @followup.followed_up_by = Contact.find_by_id(session[:contact_id]).user.id
      @contactid = Contact.find_by_id(session[:contact_id]).id
      @followup.e_status = "contact"
      if @followup.save
          redirect_to contact_path(session[:contact_id])
        else
          render action: 'contacts/show'
        end
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
      params.require(:followup).permit(:contact_id, :case_id, :followed_up_date, :followed_up_type_id, :followed_up_by, :v_outcome, :d_next_followed_up_date, :next_followed_up_type_id, :next_followed_up_by, :e_status)
    end
end
