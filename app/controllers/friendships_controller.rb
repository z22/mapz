class FriendshipsController < ApplicationController
  # before_action :set_friendship, only: [:show, :edit, :update, :destroy]


  def index
    @friendships = Friendship.all
  end

  def show
  end

  def new
    @friendship = Friendship.new
  end


  def edit
  end

  def update
    respond_to do |format|
      if @friendship.update(friendship_params)
        format.html { redirect_to @friendship, notice: 'Friendship was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @friendship.errors, status: :unprocessable_entity }
      end
    end
  end



  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])

      if @friendship.save
       falsh[:notice] = "Added friend."
       redirect_to root_url
      else
        flash[:error] = "Unable to add friend."
        redirect_to root_url
      end
  end


  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    falsh[:notice] = "Removed friendship."
    redirect_to current_user
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_friendship
    #   @friendship = Friendship.find(params[:id])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def friendship_params
      params.require(:friendship).permit(:user_id, :friend_id, :create, :destroy)
    end
end
