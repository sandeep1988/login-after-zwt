class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy, :update_contacts]
  skip_before_filter  :verify_authenticity_token
  helper_method :sort_column, :sort_direction
  # GET /contacts
  # GET /contacts.json
  def index
    @per_page = params[:per_page] || User.per_page || 10

    if  params[:e_status] == "active"
        @per_page = params[:per_page] || Contact.per_page || 10
        @contacts = Contact.all.paginate( :per_page => @per_page, :page => params[:page])
          params[:contacts_ids].each do |active_contacts| 
          contact = Contact.find(active_contacts)
          contact.update_column(:e_status, 0) 
          end
      elsif  params[:e_status] == "inactive"
        @per_page = params[:per_page] || Contact.per_page || 10
        @contacts = Contact.all.paginate( :per_page => @per_page, :page => params[:page])
          params[:contacts_ids].each do |inactive_contacts| 
          contact = Contact.find(inactive_contacts)
          contact.update_column(:e_status, 1) 
      end

      elsif  params[:e_status] == "delete"
        @per_page = params[:per_page] || Contact.per_page || 10
        @contacts = Contact.all.paginate( :per_page => @per_page, :page => params[:page])
          params[:contacts_ids].each do |delete_contacts| 
          contact = Contact.find(delete_contacts)
          if contact.destroy 
            redirect_to contacts_path
          end
      end

    elsif params[:v_contact_type].blank? && params[:last_name].blank? && params[:email].blank? && params[:v_country].blank? && params[:v_tags].blank? && params[:i_reffered_source_id].blank? && params[:first_name]
      @contacts = Contact.where("first_name like ?", "%#{params[:first_name]}%").paginate( :per_page => @per_page, :page => params[:page])
    elsif
        params[:v_contact_type].blank? && params[:last_name] && params[:email].blank? && params[:v_country].blank? && params[:v_tags].blank? && params[:i_reffered_source_id].blank? && params[:first_name]

      @contacts = Contact.where("first_name like ? and last_name like ? ", "%#{params[:first_name]}%", "%#{params[:last_name]}%").paginate( :per_page => @per_page, :page => params[:page])

    elsif
        params[:v_contact_type].blank? && params[:last_name] && params[:email] && params[:v_country].blank? && params[:v_tags].blank? && params[:i_reffered_source_id].blank? && params[:first_name]

      @contacts = Contact.where("first_name like ? and last_name like ? and email like ? ", "%#{params[:first_name]}%", "%#{params[:last_name]}%", "%#{params[:email]}%").paginate( :per_page => @per_page, :page => params[:page])

    elsif
        params[:v_contact_type].blank? && params[:last_name] && params[:email] && params[:v_country] && params[:v_tags].blank? && params[:i_reffered_source_id].blank? && params[:first_name]

      @contacts = Contact.where("first_name like ? and last_name like ? and email like ? and v_country like ? ", "%#{params[:first_name]}%", "%#{params[:last_name]}%", "%#{params[:email]}%", "%#{params[:v_country]}%").paginate( :per_page => @per_page, :page => params[:page])

    elsif
        params[:v_contact_type].blank? && params[:last_name] && params[:email] && params[:v_country] && params[:v_tags] && params[:i_reffered_source_id].blank? && params[:first_name]

      @contacts = Contact.where("first_name like ? and last_name like ? and email like ? and v_country like ? and v_tags like ?", "%#{params[:first_name]}%", "%#{params[:last_name]}%", "%#{params[:email]}%", "%#{params[:v_country]}%", "%#{params[:v_tags]}%").paginate( :per_page => @per_page, :page => params[:page])

      elsif
        params[:v_contact_type] == "0" ? "0" : "1" && params[:last_name] && params[:email] && params[:v_country] && params[:v_tags] && params[:i_reffered_source_id].blank? && params[:first_name]

      @contacts = Contact.where("first_name like ? and last_name like ? and email like ? and v_country like ? and v_tags like ? and v_contact_type like ?", "%#{params[:first_name]}%", "%#{params[:last_name]}%", "%#{params[:email]}%", "%#{params[:v_country]}%", "%#{params[:v_tags]}%", "%#{params[:v_contact_type]}%").paginate( :per_page => @per_page, :page => params[:page])

       elsif
        params[:v_contact_type] && params[:last_name] && params[:email] && params[:v_country] && params[:v_tags] && params[:i_reffered_source_id] && params[:first_name]

      @contacts = Contact.where("first_name like ? and last_name like ? and email like ? and v_country like ? and v_tags like ? and v_contact_type like ? and i_reffered_source_id like ?", "%#{params[:first_name]}%", "%#{params[:last_name]}%", "%#{params[:email]}%", "%#{params[:v_country]}%", "%#{params[:v_tags]}%", "%#{params[:v_contact_type]}%", "%#{params[:i_reffered_source_id]}%").paginate( :per_page => @per_page, :page => params[:page])
    else   
        @contacts = Contact.all.paginate( :per_page => @per_page, :page => params[:page]).order(sort_column + ' ' + sort_direction)
    end
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
    @edit_contact = Contact.find(params[:format])
    render 'contacts/edit'
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
  end

  # GET /contacts/1/edit
  def edit
    @edit_contact = Contact.find(params[:id]) 
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(contact_params)
    @contact.i_reffered_source_id = params[:i_reffered_source_id]
    @contact.v_contact_type = params[:v_contact_type] == "Outsourcing Firm" ? 1 : 0
    @contact.e_status = params[:contact][:e_status] == "Active" ? 1 : 0
    @contact.v_country = params[:v_country]
    @contact.user_id = current_user.id
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
    @contact_person = Contact.find(params[:format])
    @contact_person.v_contact_type =  params[:contact][:v_contact_type] === "Outsourcing Firm" ? "1" : "0"
    @contact_person.e_status = params[:contact][:e_status] == "Active" ? 1 : 0
    @contact_person.update_attributes(contact_params)
      redirect_to contacts_path
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

  def destroy_contact
      @contact_person = Contact.find(params[:id])
    if @contact_person.destroy
      redirect_to contacts_url
    end
  end

  def list_ajax
  end

  def details
  end

  def update_contacts
    @contact_person = Contact.find(params[:format])
    @contact_person.v_country = params[:v_country].blank? ? "india" : params[:v_country]
    @contact_person.e_status = params[:contact][:e_status] == "Active" ? "1" : "0"
    @contact_person.v_contact_type = params[:v_contact_type] == "Outsourcing Firm" ? "1" : "0"
    @contact_person.update_attributes(params[:contact])
    redirect_to contacts_path
  end

  # def contact
  #   @contact = Contact.new
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      if params[:action] == "update"
        @contact = Contact.find(params[:format])  
      else
        @contact = Contact.find(params[:id])
    end
    end

    private
      def contact_params
        params.require(:contact).permit(:first_name ,:last_name, :email, :user_id, :v_company_name, :v_im_skype, :v_website_url, :v_linkedin_url, :v_phone, :v_cell_number, :v_tags, :i_reffered_source_id, :e_status, :v_contact_type, :v_country)
      end

      def sort_column
        Contact.column_names.include?(params[:sort]) ? params[:sort] : "first_name"
      end
  
    def sort_direction
      %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
    end
end
