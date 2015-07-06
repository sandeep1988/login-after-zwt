class CasesController < ApplicationController
  before_action :set_case, only: [:show, :edit, :update, :destroy]
  # GET /cases
  # GET /cases.json
  def index
    @cases = Case.all
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

    respond_to do |format|
      if @case.save
        format.html { redirect_to @case, notice: 'Case was successfully created.' }
        format.json { render :show, status: :created, location: @case }
      else
        format.html { render :new }
        format.json { render json: @case.errors, status: :unprocessable_entity }
      end
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
      @case = Case.find(1)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def case_params
      params[:case]
    end
end
