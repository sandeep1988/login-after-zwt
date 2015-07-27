class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]
  # GET /contacts
  # GET /contacts.json
  def index
    @contacts = Contact.all
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts
  # POST /contacts.json
  def create
    # # if Contact.all.collect(&:email).include?(params[:contact][:email])
    # #     flash[:notice] = "Email Already created"
    #   else 
        @contact = Contact.new(contact_params)
        @contact.i_reffered_source_id = params[:i_reffered_source_id]
        @contact.v_contact_type = params[:v_contact_type]
        @contact.e_status = params[:contact][:e_status] == "Active" ? "1" : "0"
        @contact.v_country = params[:v_country].blank? ? "india" : params[:v_country]
        @contact.user_id = current_user.id
          # check condition for contact_type 
          if @contact.v_contact_type == "Outsourcing Firm"
            @contact.v_contact_type = "1"
          else 
            @contact.v_contact_type = "0"
          end

          if @contact.save
            # Tag store in Tag table after create contact
              Tag.create(:v_title => params[:contact][:v_tags])
            redirect_to contacts_path
          else
            render action: 'new'
          end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to @contact, notice: 'Contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'Contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def list_ajax
    @output = '{"data":[["<input type=\"checkbox\" name=\"id[]\" value=\"1\">","<a href=\"\/contacts/details\">Chris Monnat</a> <a href=\"skype:hasmukh_zwt\"><img height=\"20px\" src=\"\/img\/social\/skype-icon.png\" /><\/a> <a href=\"http:\/\/linkedin.com\" target=\"_blank\"><img height=\"20px\" src=\"\/img\/social\/linkedin-icon.png\" /><\/a>","<a href=\"http:\/\/www.bluetext.com\" target=\"_blank\">BlueText<\/a>","<a href=\"mailto:chris@bluetext.com\">chris@bluetext.com<\/a>","United Stated of America","magento, ZendFramework", "<span class=\"label label-sm label-success\">End Client<\/span>","LinkedIn","<a href=\"\/contacts\/1\/edit\" class=\"btn btn-xs default\"><i class=\"fa fa-edit\"><\/i> Edit<\/a> | <a href=\"\/contacts\/1\/delete\" class=\"btn btn-xs default\"><i class=\"fa fa-times\"><\/i> Delete<\/a>"],["<input type=\"checkbox\" name=\"id[]\" value=\"1\">","<a href=\"\/contacts/details\">Chris Monnat</a> <a href=\"skype:hasmukh_zwt\"><img height=\"20px\" src=\"\/img\/social\/skype-icon.png\" /><\/a> <a href=\"http:\/\/linkedin.com\" target=\"_blank\"><img height=\"20px\" src=\"\/img\/social\/linkedin-icon.png\" /><\/a>","<a href=\"http:\/\/www.bluetext.com\" target=\"_blank\">BlueText<\/a>","<a href=\"mailto:chris@bluetext.com\">chris@bluetext.com<\/a>","United Stated of America","magento, ZendFramework", "<span class=\"label label-sm label-success\">End Client<\/span>","LinkedIn","<a href=\"\/contacts\/1\/edit\" class=\"btn btn-xs default\"><i class=\"fa fa-edit\"><\/i> Edit<\/a> | <a href=\"\/contacts\/1\/delete\" class=\"btn btn-xs default\"><i class=\"fa fa-times\"><\/i> Delete<\/a>"],["<input type=\"checkbox\" name=\"id[]\" value=\"1\">","<a href=\"\/contacts/details\">Chris Monnat</a> <a href=\"skype:hasmukh_zwt\"><img height=\"20px\" src=\"\/img\/social\/skype-icon.png\" /><\/a> <a href=\"http:\/\/linkedin.com\" target=\"_blank\"><img height=\"20px\" src=\"\/img\/social\/linkedin-icon.png\" /><\/a>","<a href=\"http:\/\/www.bluetext.com\" target=\"_blank\">BlueText<\/a>","<a href=\"mailto:chris@bluetext.com\">chris@bluetext.com<\/a>","United Stated of America","magento, ZendFramework", "<span class=\"label label-sm label-success\">End Client<\/span>","LinkedIn","<a href=\"\/contacts\/1\/edit\" class=\"btn btn-xs default\"><i class=\"fa fa-edit\"><\/i> Edit<\/a> | <a href=\"\/contacts\/1\/delete\" class=\"btn btn-xs default\"><i class=\"fa fa-times\"><\/i> Delete<\/a>"],["<input type=\"checkbox\" name=\"id[]\" value=\"1\">","<a href=\"\/contacts/details\">Chris Monnat</a> <a href=\"skype:hasmukh_zwt\"><img height=\"20px\" src=\"\/img\/social\/skype-icon.png\" /><\/a> <a href=\"http:\/\/linkedin.com\" target=\"_blank\"><img height=\"20px\" src=\"\/img\/social\/linkedin-icon.png\" /><\/a>","<a href=\"http:\/\/www.bluetext.com\" target=\"_blank\">BlueText<\/a>","<a href=\"mailto:chris@bluetext.com\">chris@bluetext.com<\/a>","United Stated of America","magento, ZendFramework", "<span class=\"label label-sm label-success\">End Client<\/span>","LinkedIn","<a href=\"\/contacts\/1\/edit\" class=\"btn btn-xs default\"><i class=\"fa fa-edit\"><\/i> Edit<\/a> | <a href=\"\/contacts\/1\/delete\" class=\"btn btn-xs default\"><i class=\"fa fa-times\"><\/i> Delete<\/a>"],["<input type=\"checkbox\" name=\"id[]\" value=\"1\">","<a href=\"\/contacts/details\">Chris Monnat</a> <a href=\"skype:hasmukh_zwt\"><img height=\"20px\" src=\"\/img\/social\/skype-icon.png\" /><\/a> <a href=\"http:\/\/linkedin.com\" target=\"_blank\"><img height=\"20px\" src=\"\/img\/social\/linkedin-icon.png\" /><\/a>","<a href=\"http:\/\/www.bluetext.com\" target=\"_blank\">BlueText<\/a>","<a href=\"mailto:chris@bluetext.com\">chris@bluetext.com<\/a>","United Stated of America","magento, ZendFramework", "<span class=\"label label-sm label-success\">End Client<\/span>","LinkedIn","<a href=\"\/contacts\/1\/edit\" class=\"btn btn-xs default\"><i class=\"fa fa-edit\"><\/i> Edit<\/a> | <a href=\"\/contacts\/1\/delete\" class=\"btn btn-xs default\"><i class=\"fa fa-times\"><\/i> Delete<\/a>"],["<input type=\"checkbox\" name=\"id[]\" value=\"1\">","<a href=\"\/contacts/details\">Chris Monnat</a> <a href=\"skype:hasmukh_zwt\"><img height=\"20px\" src=\"\/img\/social\/skype-icon.png\" /><\/a> <a href=\"http:\/\/linkedin.com\" target=\"_blank\"><img height=\"20px\" src=\"\/img\/social\/linkedin-icon.png\" /><\/a>","<a href=\"http:\/\/www.bluetext.com\" target=\"_blank\">BlueText<\/a>","<a href=\"mailto:chris@bluetext.com\">chris@bluetext.com<\/a>","United Stated of America","magento, ZendFramework", "<span class=\"label label-sm label-success\">End Client<\/span>","LinkedIn","<a href=\"\/contacts\/1\/edit\" class=\"btn btn-xs default\"><i class=\"fa fa-edit\"><\/i> Edit<\/a> | <a href=\"\/contacts\/1\/delete\" class=\"btn btn-xs default\"><i class=\"fa fa-times\"><\/i> Delete<\/a>"],["<input type=\"checkbox\" name=\"id[]\" value=\"1\">","<a href=\"\/contacts/details\">Chris Monnat</a> <a href=\"skype:hasmukh_zwt\"><img height=\"20px\" src=\"\/img\/social\/skype-icon.png\" /><\/a> <a href=\"http:\/\/linkedin.com\" target=\"_blank\"><img height=\"20px\" src=\"\/img\/social\/linkedin-icon.png\" /><\/a>","<a href=\"http:\/\/www.bluetext.com\" target=\"_blank\">BlueText<\/a>","<a href=\"mailto:chris@bluetext.com\">chris@bluetext.com<\/a>","United Stated of America","magento, ZendFramework", "<span class=\"label label-sm label-success\">End Client<\/span>","LinkedIn","<a href=\"\/contacts\/1\/edit\" class=\"btn btn-xs default\"><i class=\"fa fa-edit\"><\/i> Edit<\/a> | <a href=\"\/contacts\/1\/delete\" class=\"btn btn-xs default\"><i class=\"fa fa-times\"><\/i> Delete<\/a>"],["<input type=\"checkbox\" name=\"id[]\" value=\"1\">","<a href=\"\/contacts/details\">Chris Monnat</a> <a href=\"skype:hasmukh_zwt\"><img height=\"20px\" src=\"\/img\/social\/skype-icon.png\" /><\/a> <a href=\"http:\/\/linkedin.com\" target=\"_blank\"><img height=\"20px\" src=\"\/img\/social\/linkedin-icon.png\" /><\/a>","<a href=\"http:\/\/www.bluetext.com\" target=\"_blank\">BlueText<\/a>","<a href=\"mailto:chris@bluetext.com\">chris@bluetext.com<\/a>","United Stated of America","magento, ZendFramework", "<span class=\"label label-sm label-success\">End Client<\/span>","LinkedIn","<a href=\"\/contacts\/1\/edit\" class=\"btn btn-xs default\"><i class=\"fa fa-edit\"><\/i> Edit<\/a> | <a href=\"\/contacts\/1\/delete\" class=\"btn btn-xs default\"><i class=\"fa fa-times\"><\/i> Delete<\/a>"],["<input type=\"checkbox\" name=\"id[]\" value=\"1\">","<a href=\"\/contacts/details\">Chris Monnat</a> <a href=\"skype:hasmukh_zwt\"><img height=\"20px\" src=\"\/img\/social\/skype-icon.png\" /><\/a> <a href=\"http:\/\/linkedin.com\" target=\"_blank\"><img height=\"20px\" src=\"\/img\/social\/linkedin-icon.png\" /><\/a>","<a href=\"http:\/\/www.bluetext.com\" target=\"_blank\">BlueText<\/a>","<a href=\"mailto:chris@bluetext.com\">chris@bluetext.com<\/a>","United Stated of America","magento, ZendFramework", "<span class=\"label label-sm label-success\">End Client<\/span>","LinkedIn","<a href=\"\/contacts\/1\/edit\" class=\"btn btn-xs default\"><i class=\"fa fa-edit\"><\/i> Edit<\/a> | <a href=\"\/contacts\/1\/delete\" class=\"btn btn-xs default\"><i class=\"fa fa-times\"><\/i> Delete<\/a>"],["<input type=\"checkbox\" name=\"id[]\" value=\"1\">","<a href=\"\/contacts/details\">Chris Monnat</a> <a href=\"skype:hasmukh_zwt\"><img height=\"20px\" src=\"\/img\/social\/skype-icon.png\" /><\/a> <a href=\"http:\/\/linkedin.com\" target=\"_blank\"><img height=\"20px\" src=\"\/img\/social\/linkedin-icon.png\" /><\/a>","<a href=\"http:\/\/www.bluetext.com\" target=\"_blank\">BlueText<\/a>","<a href=\"mailto:chris@bluetext.com\">chris@bluetext.com<\/a>","United Stated of America","magento, ZendFramework", "<span class=\"label label-sm label-success\">End Client<\/span>","LinkedIn","<a href=\"\/contacts\/1\/edit\" class=\"btn btn-xs default\"><i class=\"fa fa-edit\"><\/i> Edit<\/a> | <a href=\"\/contacts\/1\/delete\" class=\"btn btn-xs default\"><i class=\"fa fa-times\"><\/i> Delete<\/a>"]],"draw":1,"recordsTotal":100,"recordsFiltered":100}';
    render json: @output
  end

  def details
  end

  def contact
    @contact = Contact.new
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # def contact_params
    #   params.require(:contact).permit(:first_name ,:last_name, :email, :user_id, :v_company_name, :v_im_skype, :v_website_url, :v_linkedin_url, :v_phone, :v_cell_number, :v_tags, :i_reffered_source_id, :e_status, :v_contact_type, :v_country)
    # end

    private
    
    def contact_params
      params.require(:contact).permit(:first_name ,:last_name, :email, :user_id, :v_company_name, :v_im_skype, :v_website_url, :v_linkedin_url, :v_phone, :v_cell_number, :v_tags, :i_reffered_source_id, :e_status, :v_contact_type, :v_country)
    end
end
