class RolesController < ApplicationController
  before_action :authenticate_user!
  before_filter :can_access_admin_pages
  before_action :set_role, only: [:show, :edit, :update, :destroy]

  # GET /roles
  # GET /roles.json
  def index
    @roles = Role.where(organisation_id: @organisation.id)
  end

  # GET /roles/1
  # GET /roles/1.json
  def show
  end

  # GET /roles/new
  def new
    @role = Role.new(organisation_id: @organisation.id)
  end

  # GET /roles/1/edit
  def edit
  end

  # POST /roles
  # POST /roles.json
  def create
    @role = Role.new(role_params)

    respond_to do |format|
      if @role.save
        format.html { redirect_to organisation_roles_url(@organisation), notice: 'Role was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /roles/1
  # PATCH/PUT /roles/1.json
  def update
    respond_to do |format|
      if @role.update(role_params)
        format.html { redirect_to organisation_roles_url(@organisation), notice: 'Role was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /roles/1
  # DELETE /roles/1.json
  def destroy
    @role.destroy
    respond_to do |format|
      format.html { redirect_to organisation_roles_url(@organisation) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_role
      @role = Role.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def role_params
      params.require(:role).permit(:name, :description, :organisation_id, :can_access_boxes_index, :can_access_boxes_new, :can_access_boxes_show, :can_access_boxes_edit, :can_access_boxes_destroy, :can_access_boxes_new, :can_access_articles_edit, :can_access_articles_destroy, :can_access_comments_create, :can_access_comments_edit, :can_access_comments_destroy, :can_access_boxes_assign_users)
    end
end
