class SessionsController < ApplicationController
  def new
    # @user = current_user
  end
  
  def create
    open_id_authentication(params[:openid_url])
  end
  
  def destroy
    
  end
  
  protected
  
  
  def open_id_authentication(openid_url)
    authenticate_with_open_id(openid_url, :required => [:nickname, :email]) do |result, identity_url, registration|
      if result.successful?
        @user = User.find_or_initialize_by_identity_url(identity_url)
        if @user.new_record?
          @user.nickname = registration['nickname']
          @user.email = registration['email']
          @user.save(false)
        end
        self.current_user = @user
        successful_login
      else
        failed_login result.message
      end
    end
  end
  
  def failed_login(message = "Authentication failed.")
    flash.now[:error] = message
    render :action => 'new'
  end

  def successful_login
    if params[:remember_me] == "1"
      self.current_user.remember_me
      cookies[:auth_token] = { :value => self.current_user.remember_token , :expires => self.current_user.remember_token_expires_at }
    end
    redirect_back_or_default('/')
    flash[:notice] = "Logged in successfully"
  end
  
end
