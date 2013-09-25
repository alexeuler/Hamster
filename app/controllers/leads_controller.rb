class LeadsController < ApplicationController
  before_action :set_lead, only: [:show, :edit, :update, :destroy]
  before_filter :require_admin, :except=>[:new, :create]

  # GET /leads
  # GET /leads.json
  def index
    @leads = Lead.order("created_at DESC").page(params[:page]).per(20)
  end

  # GET /leads/1
  # GET /leads/1.json
  def show
  end

  # GET /leads/new
  def new
    @lead = Lead.new
  end

  # GET /leads/1/edit
  def edit
  end

  # POST /leads
  # POST /leads.json
  def create
    @lead = Lead.new(lead_params)
    if @lead.save
      InfoMailer.new_lead(@lead).deliver
      if request.xhr?
        render text:'success'
      else
        redirect_to @lead, notice: 'Lead was successfully created.'
      end
    else
      if request.xhr?
        render text:'error'
      else
        render action: 'new'
      end
    end
  end
  # PATCH/PUT /leads/1
  # PATCH/PUT /leads/1.json
  def update
    @lead.updated_by=current_user.email
    respond_to do |format|
      if @lead.update(lead_params)
        format.html { redirect_to leads_path, notice: 'Lead was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @lead.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leads/1
  # DELETE /leads/1.json
  def destroy
    @lead.destroy
    respond_to do |format|
      format.html { redirect_to leads_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_lead
    @lead = Lead.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def lead_params
    params.require(:lead).permit(:phone, :address, :name, :email, :color, :comments, :status, :admin_comments)
  end
end
