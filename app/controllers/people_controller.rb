class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  # GET /people
  # GET /people.json
  def index
    if params[:order]
      @people = Person.order(params[:order]).paginate(:page => params[:page], :per_page => 15)
    elsif params[:category_id]
      @people = Category.find(params[:category_id]).people.paginate(:page => params[:page], :per_page => 15)
    elsif params[:region_id]
      @people = Region.find(params[:region_id]).people.paginate(:page => params[:page], :per_page => 15)
    else  
      @people = Person.paginate(:page => params[:page], :per_page => 15)
    end  
  end

  #def fop_count
  #  m={}
  #  Person.where(status: "припинено").group(:region_id).count.each {|k,v| m[Region.find(k).region_name] = v}
  #  return m
  #end


  def search
    search_terms={}
    search_terms[:surname] = params[:surname] if params[:surname] and params[:surname]!=''
    search_terms[:status] = params[:status] if params[:status] and params[:status]!=''
    search_terms[:region] = params[:region] if params[:region] and params[:region]!=''
    @people = Person.where(search_terms).paginate(:page => params[:page], :per_page => 15)
  end

  # GET /people/1
  # GET /people/1.json
  def show
  end

  # GET /people/new
  def new
    @person = Person.new
  end

  # GET /people/1/edit
  def edit
  end

  # POST /people
  # POST /people.json
  def create
    @person = Person.new(person_params)

    respond_to do |format|
      if @person.save
        format.html { redirect_to @person, notice: 'Person was successfully created.' }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to @person, notice: 'Person was successfully updated.' }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person.destroy
    respond_to do |format|
      format.html { redirect_to people_url, notice: 'Person was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_params
      params.require(:person).permit(:surname, :name, :middle_name, :zip_code, :address, :status)
    end
end
