class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  def new
    @user = User.new
  end




  def index

  end
  def show
  end
  def edit

  end

def buscar
    @user = User
    if params[:search]
      @user = User.search(params[:search])
    else
      @user = User.all
    end
end



def edit_multiple
    @profiles = Profile.all
    @user = User.all
    if params[:search]
      @user = User.search(params[:search])
    else
      @user = User.all
    end
end
def update_multiple
  @user = User.update(params[:users].keys, params[:users].values)
  #@user.reject! { |u| u.errors.empty? }
    redirect_to edit_multiple_users_url
end

def edit_multiple_condiciones
    @condiciones = CondicionPago.all.collect {|p| [ p.nombre, p.id ] }
    @user = User.all
    if params[:search]
      @user = User.search(params[:search])
    else
      @user = User.all
    end
end

def update_multiple_condiciones
  @user = User.update(params[:users].keys, params[:users].values)
  @user.reject! { |u| u.errors.empty? }
  if @user.empty?
    redirect_to edit_multiple_condiciones_users_url
  else
    render "index"
  end
end






  def create
  	@user = User.new(user_params)


  	if @user.save
  		  session[:return_to] ||= request.referer
        redirect_to session.delete(:return_to), :notice => "Se creo el cliente #{@user.email}"
    else
  		render :new 
  	end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'El usuario se actualizo correctamente' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to edit_multiple_users_url, notice: 'El usuario fue eliminado correctamente' }
      format.json { head :no_content }
    end
  end

  	private
    def set_multiple_ids
      params[:users]
    end

    def set_user
      @user = User.find(params[:id])
    end
		def user_params
			params.require(:user).permit(:email, :password, :password_confirmation)
		end

end
