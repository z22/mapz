class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :find_group

  def index
    if @group
      @users = @group.users.sorted
    else
      @users = User.all
    end

    @hash = Gmaps4rails.build_markers(@users) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
      marker.infowindow user.notes
      # marker.picture({
      #   "url" => "#",
      #   "width" => 32,
      #   "height" => 32})
    end

  end

  def show
    @user = User.find(params[:id])
    # @friends = User.friends
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

      if @user.save
        session[:user_id] = @user.id
        UserMailer.welcome_email(@user).deliver
        flash[:notice] = 'Thank you for signing up! You are now logged in.'
        redirect_to root_path
      else
        render :action => 'new'
      end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to action: 'index', notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:latitude, :longitude, :address, :notes, :name, :email, :password)
    end

    def find_group
      if params[:group_id]
        @group = Group.find(params[:group_id])
      end
    end


end
