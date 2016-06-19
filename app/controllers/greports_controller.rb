class GreportsController < ApplicationController
  before_action :set_greport, only: [:show, :edit, :update, :destroy]

  # GET /greports
  # GET /greports.json
  def index
    @greports = Greport.all
     @toppers=Greport.all.order(percent: :desc).limit(3)
  end

   def buildlist
   end
  # GET /greports/1
  # GET /greports/1.json
  def show

 end


  # GET /greports/new
  def new
    @greport = Greport.new
  end

  # GET /greports/1/edit
  def edit
  end

  # POST /greports
  # POST /greports.json
  def create
    @greport = Greport.new(greport_params)
    @greport.user = User.first

    respond_to do |format|
      if @greport.save
        format.html { redirect_to @greport,  notice: 'Record was successfully created.' }
        format.json { render :show, status: :created, location: @greport }
      else
        format.html { render :new }
        format.json { render json: @greport.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /greports/1
  # PATCH/PUT /greports/1.json
  def update
    respond_to do |format|
      if @greport.update(greport_params)
        format.html { redirect_to @greport, notice: 'Record was successfully updated.' }
        format.json { render :show, status: :ok, location: @greport }
      else
        format.html { render :edit }
        format.json { render json: @greport.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /greports/1
  # DELETE /greports/1.json
  def destroy
    @destroy=Greport.all
    @destroy.destroy
    #@greport.destroy
    respond_to do |format|
      format.html { redirect_to buildlist_new_greport_path, notice: 'Records were successfully destroyed.You can now create a a new report!' }
      format.json { head :no_content }
    end
  end

  def destroyall
    Greport.destroy
    respond_to do |format|
      format.html { redirect_to buildlist_new_greport_path, notice: 'Records were successfully destroyed.You can now create a a new report!' }
      format.json { head :no_content }
    end
  end

  def import
    Greport.import(params[:file])
    redirect_to(buildlist_new_greport_path,notice: "Imported successfully")
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_greport
      @greport = Greport.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def greport_params
      params.require(:greport).permit(:roll, :name, :marksobt, :marksout, :percent, :year, :exam, :sem, :session, :batch, :result, :sgpa)
    end
end
