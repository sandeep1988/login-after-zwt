class SalesController < ApplicationController
  #before_action :set_sale, only: [:show, :edit, :update, :destroy]
    helper_method :sort_column, :sort_direction
  skip_before_filter  :verify_authenticity_token
  layout "application"
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_user
  before_filter :authorize_admin, :only => [:index, :show, :new, :create, :destroy]

  # GET /sales
  # GET /sales.json
  def index
    @per_page = params[:per_page] || User.per_page || 1
      if  params[:e_status_user] == "active"
        @per_page = params[:per_page] || User.per_page || 10
        @sales = User.all.paginate( :per_page => @per_page, :page => params[:page])
          params[:sales_ids].each do |active_users| 
          user = User.find(active_users)
          user.update_column(:e_status, 1) 
        end

      elsif  params[:e_status_user] == "inactive"
        @per_page = params[:per_page] || User.per_page || 10
        @sales = User.all.paginate( :per_page => @per_page, :page => params[:page])
          params[:sales_ids].each do |inactive_users| 
          user = User.find(inactive_users)
          user.update_column(:e_status, 0) 
      end

     elsif  params[:e_status_user] == "delete"
        @per_page = params[:per_page] || User.per_page || 10
        @sales = User.all.paginate( :per_page => @per_page, :page => params[:page])
          params[:sales_ids].each do |delete_users| 
          user = User.find(delete_users)
           if user.destroy 
            redirect_to sales_path
          end
        end

     elsif !params[:v_firstname].blank? && !params[:email].blank? && !params[:v_phone].blank? && !params[:e_status].blank?
       @sales = User.where("v_firstname like ? and email like ? and v_phone like ? and e_status like ?", "%#{params[:v_firstname]}%", "%#{params[:email]}%", "%#{params[:v_phone]}%", "%#{params[:e_status]}%" ).paginate( :per_page => @per_page, :page => params[:page])
     elsif 
        !params[:v_firstname].blank? && !params[:email].blank? && !params[:e_status].blank? && params[:v_phone].blank? 
        
          @sales = User.where("v_firstname like ? and email like ? and e_status like ?", "%#{params[:v_firstname]}%", "%#{params[:email]}%" ,"%#{params[:e_status]}%").paginate( :per_page => @per_page, :page => params[:page])
          
      elsif 
        params[:v_firstname].blank? && !params[:email].blank? && !params[:v_phone].blank? && !params[:e_status].blank? 
      
        @sales = User.where("email like ? and v_phone like ? and e_status like ?", "%#{params[:email]}%", "%#{params[:v_phone]}%" ,"%#{params[:e_status]}%").paginate( :per_page => @per_page, :page => params[:page])
        
      elsif 
        !params[:v_firstname].blank? && params[:email].blank? && !params[:v_phone].blank? & !params[:e_status].blank? 
        
        @sales = User.where("v_phone like ? and v_firstname like ? and e_status like ?", "%#{params[:v_phone]}%", "%#{params[:v_firstname]}%" ,"%#{params[:e_status]}%").paginate( :per_page => @per_page, :page => params[:page])

      elsif 
        !params[:v_firstname].blank? && !params[:email].blank? && !params[:v_phone].blank? & params[:e_status] == "1"
      
        @sales = User.where("v_phone like ? and v_firstname like ?, and email like ?  ", "%#{params[:v_phone]}%", "%#{params[:v_firstname]}%" ,"%#{params[:email]}%").paginate( :per_page => @per_page, :page => params[:page])

      elsif 
        !params[:v_firstname].blank? && params[:email].blank? && params[:v_phone].blank? 
        
          @sales = User.where("v_firstname like ? && e_status like ?", "%#{params[:v_firstname]}%", "%#{params[:e_status]}%").paginate( :per_page => @per_page, :page => params[:page])
          
      elsif 
        params[:v_firstname].blank? && !params[:email].blank? && params[:v_phone].blank? 
        
          @sales = User.where("email like ? && e_status like ?", "%#{params[:email]}%", "%#{params[:e_status]}%").paginate( :per_page => @per_page, :page => params[:page])
          
      elsif 
        params[:v_firstname].blank? && params[:email].blank? && !params[:v_phone].blank?  
        
          @sales = User.where("v_phone like ? && e_status like ?", "%#{params[:v_phone]}%", "%#{params[:e_status]}%").paginate( :per_page => @per_page, :page => params[:page])
      
      elsif 
        params[:v_firstname].blank? && params[:email].blank? && params[:v_phone].blank? && !params[:e_status].blank? 
        
          @sales = User.where("e_status like ?", "%#{params[:e_status]}%").paginate( :per_page => @per_page, :page => params[:page])

      elsif 
        params[:v_firstname].blank? && params[:email].blank? && !params[:v_phone].blank? && !params[:e_status].blank? 
        
          @sales = User.where("v_phone like ? and e_status like ? ", "%#{params[:v_phone]}%", "%#{params[:e_status]}%").paginate( :per_page => @per_page, :page => params[:page])
          
      elsif 
        params[:v_firstname].blank? && !params[:email].blank? && params[:v_phone].blank? && !params[:e_status].blank? 
          @sales = User.where("email like ? and e_status like ? ", "%#{params[:email]}%", "%#{params[:e_status]}%").paginate( :per_page => @per_page, :page => params[:page])

      elsif 
        !params[:v_firstname].blank? && params[:email].blank? && params[:v_phone].blank? && !params[:e_status].blank?
          @sales = User.where("v_firstname like ? and e_status like ? ", "%#{params[:v_firstname]}%", "%#{params[:e_status]}%").paginate( :per_page => @per_page, :page => params[:page])
      elsif 
        params[:v_firstname].blank? && params[:email].blank? && params[:v_phone].blank? && params[:e_status] == "1"
          @sales = User.where("e_status like ? ","%#{params[:e_status]}%").paginate( :per_page => @per_page, :page => params[:page])
    else
      @per_page = params[:per_page] || User.per_page || 10
      @sales = User.all.paginate( :per_page => @per_page, :page => params[:page]).order(sort_column + ' ' + sort_direction)
    end
  end
  # GET /sales/1
  # GET /sales/1.json
  def show
    @salesuser = User.find(params[:format])
    render 'sales/edit'
  end

  # GET /sales/new
  def new
  end

  # GET /sales/1/edit
  def edit
    @salesuser = User.find(params[:id])
  end

  # POST /sales
  # POST /sales.json
  def create
  end

  def welcome
    @salesperson = User.new(user_params)
      if @salesperson.save
        UserMailer.welcome_email(@salesperson).deliver
        redirect_to sales_path
      else
        redirect_to new_sale_path
      end
  end
  # PATCH/PUT /sales/1
  # PATCH/PUT /sales/1.json
  def update
    @sales_person = User.find(params[:format])
      current_skypeid = [@sales_person.v_im_skype]
      current_email = [@sales_person.email]
      current_gmail = [@sales_person.v_gmail]
      all_emailid = User.all.collect(&:email) - current_email
      all_skypeid = User.all.collect(&:v_im_skype) - current_skypeid
      all_gmailid = User.all.collect(&:v_gmail) - current_gmail

      if 
        all_skypeid.include?(params[:user][:v_im_skype]) && all_gmailid.include?(params[:user][:v_gmail]) && all_emailid.include?(params[:user][:email])
          flash[:notice] = "This Skype Id , Gmail id , Email Id already exist"
          redirect_to request.path
          
        elsif 
          all_skypeid.include?(params[:user][:v_im_skype]) && all_emailid.include?(params[:user][:email])
          flash[:notice] = "This Skype Id and Email id already exist"
          redirect_to request.path

        elsif 
          all_skypeid.include?(params[:user][:v_im_skype]) && all_gmailid.include?(params[:user][:v_gmail])
          flash[:notice] = "This Skype Id and Gmail id already exist"
          redirect_to request.path

        elsif 
            all_emailid.include?(params[:user][:email])
            flash[:notice] = "This Email Id is already exist"
            redirect_to request.path

        elsif 
          all_gmailid.include?(params[:user][:v_gmail])
          flash[:notice] = "This Gmail Id is already exist"
          redirect_to request.path

        elsif 
          all_gmailid.include?(params[:user][:v_gmail]) && all_emailid.include?(params[:user][:email])
          flash[:notice] = "This Gmail Id and Email id already exist"
          redirect_to request.path
        elsif 
            all_skypeid.include?(params[:user][:v_im_skype])
            flash[:notice] = "This Skype Id is already exist"
            redirect_to request.path
      else    
              if params[:user][:password].blank?
                params[:user][:password].delete :password
                  if params[:e_type] == 'false'
                    @sales_person.e_status = 0
                    @sales_person.update_without_password(params.require(:user).permit(:email, :e_status, :v_firstname, :v_lastname, :v_im_skype, :v_im_password, :v_gmail, :v_linkedin_url, :v_phone, :e_type))
                      redirect_to sales_path
                else 
                    @sales_person.e_status = 1
                    @sales_person.update_without_password(params.require(:user).permit(:email, :e_status, :v_firstname, :v_lastname, :v_im_skype, :v_im_password, :v_gmail, :v_linkedin_url, :v_phone, :e_type))
                        redirect_to sales_path
                end
        end
    end
  end

  def update_sales
    @sales_person = User.find(params[:format])
    @sales_person.update_attributes(params[:user])
    redirect_to sales_path
  end

  # DELETE /sales/1
  # DELETE /sales/1.json
  def destroy
    @sales_person = User.find(params[:format])
    if @sales_person.destroy
      redirect_to sales_url 
    end
  end

  def destroy_user
    @sales_person = User.find(params[:id])
    if @sales_person.destroy
      redirect_to sales_url
    end
  end
  
  def my_profile
  end
  
  def dashboard
  end
  
  def search
  end

 def list_ajax
    @sales = User.all.paginate(:page => params[:page], :per_page => 10)
    render json: @sales.to_json
end

private

  def invalid_user
    logger.error "Attempt to access invalid User #{params[:id]}"
    redirect_to sales_path, notice: 'Invalid User'
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :e_status, :v_firstname, :v_lastname, :v_im_skype, :v_im_password, :v_gmail, :v_linkedin_url, :v_phone, :e_type)
  end
  def account_update_params
    params.require(:user).permit(:v_firstname, :v_lastname, :email, :password, :v_im_skype, :v_im_password, :v_phone, :v_gmail, :v_linkedin_url, :v_phone, :e_type, :e_status)
  end

  def sort_column
      User.column_names.include?(params[:sort]) ? params[:sort] : "v_firstname"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end

  def authorize_admin
    return unless !current_user.e_type? == false
    redirect_to root_path, alert: 'Admins only!'
  end
end
