class HamstersController < ApplicationController
  before_action :set_hamster, only: [:show, :edit, :update, :destroy]
  before_filter :require_admin, :except=>[:new, :create]

  # GET /hamsters
  # GET /hamsters.json
  def index
    @hamsters = Hamster.order("created_at DESC").page(params[:page]).per(20)
  end

  # GET /hamsters/1
  # GET /hamsters/1.json
  def show
  end

  # GET /hamsters/new
  def new
    @hamster = Hamster.new
  end

  # GET /hamsters/1/edit
  def edit
  end

  # POST /hamsters
  # POST /hamsters.json
  def create
    @hamster = Hamster.new(hamster_params)
    if @hamster.save
      InfoMailer.new_hamster(@hamster).deliver
      if request.xhr?
        render text:'success'
      else
        redirect_to @hamster, notice: 'Hamster was successfully created.'
      end
    else
      if request.xhr?
        render text:'error'
      else
        render action: 'new'
      end
    end
  end
  # PATCH/PUT /hamsters/1
  # PATCH/PUT /hamsters/1.json
  def update
    @hamster.updated_by=current_user.email
    respond_to do |format|
      if @hamster.update(hamster_params)
        format.html { redirect_to hamsters_path, notice: 'Hamster was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @hamster.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hamsters/1
  # DELETE /hamsters/1.json
  def destroy
    @hamster.destroy
    respond_to do |format|
      format.html { redirect_to hamsters_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_hamster
    @hamster = Hamster.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def hamster_params
    params.require(:hamster).permit(:phone, :address, :name, :email, :color, :comments, :status, :admin_comments)
  end
end
