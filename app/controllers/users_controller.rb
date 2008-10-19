class UsersController < ApplicationController

  # render new.rhtml
  def new
  end

  def create
    cookies.delete :auth_token
    # protects against session fixation attacks, wreaks havoc with 
    # request forgery protection.
    # uncomment at your own risk
    # reset_session
    @user = User.new(params[:user])
    @user.role = "User"
    @user.save
    if @user.errors.empty?
      self.current_user = @user
      redirect_to(@user)
      flash[:notice] = "Thanks for signing up!"
    else
      render :action => 'new'
    end
  end

  def show
    @pieces = Piece.find(:all, :conditions => ['user_id=?' , current_user.id])
    @inbox = Message.find(:all, :conditions => ['recv_user=?', current_user.id])
    @outbox = Message.find(:all, :conditions => ['sent_user=?', current_user.id])
  end

end
