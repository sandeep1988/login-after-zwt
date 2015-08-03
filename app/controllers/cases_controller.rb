class CasesController < ApplicationController
  before_action :set_case, only: [:show, :edit, :update, :destroy]
  skip_before_filter  :verify_authenticity_token
  helper_method :sort_column, :sort_direction
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_case
  # GET /cases
  # GET /cases.json
  def index
    @per_page = params[:per_page] || Case.per_page || 10
     @cases = Case.all.paginate( :per_page => @per_page, :page => params[:page]).order(sort_column + ' ' + sort_direction)
  end

  # GET /cases/1
  # GET /cases/1.json
  def show
  end

  # GET /cases/new
  def new
    @case = Case.new
  end

  # GET /cases/1/edit
  def edit
  end

  # POST /cases
  # POST /cases.json
  def create
    @case = Case.new(case_params)
    @case.v_sales_person_id = current_user.id
    @case.e_status = params[:e_status]
      if @case.save
        redirect_to cases_path
      else
        render action: 'new'
      end
  end

  # PATCH/PUT /cases/1
  # PATCH/PUT /cases/1.json
  def update
    respond_to do |format|
      if @case.update(case_params)
        format.html { redirect_to @case, notice: 'Case was successfully updated.' }
        format.json { render :show, status: :ok, location: @case }
      else
        format.html { render :edit }
        format.json { render json: @case.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cases/1
  # DELETE /cases/1.json
  def destroy
    @case.destroy
    respond_to do |format|
      format.html { redirect_to cases_url, notice: 'Case was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def list_ajax
    @output = '{"data":[["<input type=\"checkbox\" name=\"id[]\" value=\"1\">","<a href=\"\/cases/details\">Case title will display here with long text</a>","Chris Monnat","Kavis Jash","<a href=\"http:\/\/www.google.com\">http:\/\/www.google.com<\/a>, <a href=\"http:\/\/www.yahoo.com\">http:\/\/www.google.com<\/a>","magento, ZendFramework", "<span class=\"label label-sm label-success\">Won<\/span>","<a href=\"\/cases\/1\/edit\" class=\"btn btn-xs default\"><i class=\"fa fa-edit\"><\/i> Edit<\/a> | <a href=\"\/cases\/1\/delete\" class=\"btn btn-xs default\"><i class=\"fa fa-times\"><\/i> Delete<\/a>"],["<input type=\"checkbox\" name=\"id[]\" value=\"1\">","<a href=\"\/cases/details\">Case title will display here with long text</a>","Chris Monnat","Kavis Jash","<a href=\"http:\/\/www.google.com\">http:\/\/www.google.com<\/a>, <a href=\"http:\/\/www.yahoo.com\">http:\/\/www.google.com<\/a>","magento, ZendFramework", "<span class=\"label label-sm label-success\">Won<\/span>","<a href=\"\/cases\/1\/edit\" class=\"btn btn-xs default\"><i class=\"fa fa-edit\"><\/i> Edit<\/a> | <a href=\"\/cases\/1\/delete\" class=\"btn btn-xs default\"><i class=\"fa fa-times\"><\/i> Delete<\/a>"],["<input type=\"checkbox\" name=\"id[]\" value=\"1\">","<a href=\"\/cases/details\">Case title will display here with long text</a>","Chris Monnat","Kavis Jash","<a href=\"http:\/\/www.google.com\">http:\/\/www.google.com<\/a>, <a href=\"http:\/\/www.yahoo.com\">http:\/\/www.google.com<\/a>","magento, ZendFramework", "<span class=\"label label-sm label-success\">Won<\/span>","<a href=\"\/cases\/1\/edit\" class=\"btn btn-xs default\"><i class=\"fa fa-edit\"><\/i> Edit<\/a> | <a href=\"\/cases\/1\/delete\" class=\"btn btn-xs default\"><i class=\"fa fa-times\"><\/i> Delete<\/a>"],["<input type=\"checkbox\" name=\"id[]\" value=\"1\">","<a href=\"\/cases/details\">Case title will display here with long text</a>","Chris Monnat","Kavis Jash","<a href=\"http:\/\/www.google.com\">http:\/\/www.google.com<\/a>, <a href=\"http:\/\/www.yahoo.com\">http:\/\/www.google.com<\/a>","magento, ZendFramework", "<span class=\"label label-sm label-success\">Won<\/span>","<a href=\"\/cases\/1\/edit\" class=\"btn btn-xs default\"><i class=\"fa fa-edit\"><\/i> Edit<\/a> | <a href=\"\/cases\/1\/delete\" class=\"btn btn-xs default\"><i class=\"fa fa-times\"><\/i> Delete<\/a>"],["<input type=\"checkbox\" name=\"id[]\" value=\"1\">","<a href=\"\/cases/details\">Case title will display here with long text</a>","Chris Monnat","Kavis Jash","<a href=\"http:\/\/www.google.com\">http:\/\/www.google.com<\/a>, <a href=\"http:\/\/www.yahoo.com\">http:\/\/www.google.com<\/a>","magento, ZendFramework", "<span class=\"label label-sm label-success\">Won<\/span>","<a href=\"\/cases\/1\/edit\" class=\"btn btn-xs default\"><i class=\"fa fa-edit\"><\/i> Edit<\/a> | <a href=\"\/cases\/1\/delete\" class=\"btn btn-xs default\"><i class=\"fa fa-times\"><\/i> Delete<\/a>"],["<input type=\"checkbox\" name=\"id[]\" value=\"1\">","<a href=\"\/cases/details\">Case title will display here with long text</a>","Chris Monnat","Kavis Jash","<a href=\"http:\/\/www.google.com\">http:\/\/www.google.com<\/a>, <a href=\"http:\/\/www.yahoo.com\">http:\/\/www.google.com<\/a>","magento, ZendFramework", "<span class=\"label label-sm label-success\">Won<\/span>","<a href=\"\/cases\/1\/edit\" class=\"btn btn-xs default\"><i class=\"fa fa-edit\"><\/i> Edit<\/a> | <a href=\"\/cases\/1\/delete\" class=\"btn btn-xs default\"><i class=\"fa fa-times\"><\/i> Delete<\/a>"],["<input type=\"checkbox\" name=\"id[]\" value=\"1\">","<a href=\"\/cases/details\">Case title will display here with long text</a>","Chris Monnat","Kavis Jash","<a href=\"http:\/\/www.google.com\">http:\/\/www.google.com<\/a>, <a href=\"http:\/\/www.yahoo.com\">http:\/\/www.google.com<\/a>","magento, ZendFramework", "<span class=\"label label-sm label-success\">Won<\/span>","<a href=\"\/cases\/1\/edit\" class=\"btn btn-xs default\"><i class=\"fa fa-edit\"><\/i> Edit<\/a> | <a href=\"\/cases\/1\/delete\" class=\"btn btn-xs default\"><i class=\"fa fa-times\"><\/i> Delete<\/a>"],["<input type=\"checkbox\" name=\"id[]\" value=\"1\">","<a href=\"\/cases/details\">Case title will display here with long text</a>","Chris Monnat","Kavis Jash","<a href=\"http:\/\/www.google.com\">http:\/\/www.google.com<\/a>, <a href=\"http:\/\/www.yahoo.com\">http:\/\/www.google.com<\/a>","magento, ZendFramework", "<span class=\"label label-sm label-success\">Won<\/span>","<a href=\"\/cases\/1\/edit\" class=\"btn btn-xs default\"><i class=\"fa fa-edit\"><\/i> Edit<\/a> | <a href=\"\/cases\/1\/delete\" class=\"btn btn-xs default\"><i class=\"fa fa-times\"><\/i> Delete<\/a>"],["<input type=\"checkbox\" name=\"id[]\" value=\"1\">","<a href=\"\/cases/details\">Case title will display here with long text</a>","Chris Monnat","Kavis Jash","<a href=\"http:\/\/www.google.com\">http:\/\/www.google.com<\/a>, <a href=\"http:\/\/www.yahoo.com\">http:\/\/www.google.com<\/a>","magento, ZendFramework", "<span class=\"label label-sm label-success\">Won<\/span>","<a href=\"\/cases\/1\/edit\" class=\"btn btn-xs default\"><i class=\"fa fa-edit\"><\/i> Edit<\/a> | <a href=\"\/cases\/1\/delete\" class=\"btn btn-xs default\"><i class=\"fa fa-times\"><\/i> Delete<\/a>"],["<input type=\"checkbox\" name=\"id[]\" value=\"1\">","<a href=\"\/cases/details\">Case title will display here with long text</a>","Chris Monnat","Kavis Jash","<a href=\"http:\/\/www.google.com\">http:\/\/www.google.com<\/a>, <a href=\"http:\/\/www.yahoo.com\">http:\/\/www.google.com<\/a>","magento, ZendFramework", "<span class=\"label label-sm label-success\">Won<\/span>","<a href=\"\/cases\/1\/edit\" class=\"btn btn-xs default\"><i class=\"fa fa-edit\"><\/i> Edit<\/a> | <a href=\"\/cases\/1\/delete\" class=\"btn btn-xs default\"><i class=\"fa fa-times\"><\/i> Delete<\/a>"]],"draw":1,"recordsTotal":100,"recordsFiltered":100}';
    render json: @output
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_case
      @case = Case.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def case_params
       params.require(:case).permit(:v_contact_id ,:v_sales_person_id, :v_title, :v_desc, :v_reference_urls, :v_file_attachments, :v_tags, :e_status, :v_note)
    end

  private
      def invalid_case
        logger.error "Attempt to access invalid case #{params[:id]}"
        redirect_to cases_path, notice: 'Invalid case'
      end

      def sort_column
        Contact.column_names.include?(params[:sort]) ? params[:sort] : "v_title"
      end
  
    def sort_direction
      %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
    end
end
