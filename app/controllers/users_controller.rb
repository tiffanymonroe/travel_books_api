class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  before_action :authenticate_token, except: [:login, :create]
  before_action :authorize_user, except: [:login, :create, :index]

  # user login
  def login
    puts '--- LOGIN ---'
    puts username: params[:user][:username]
    puts password: params[:user][:password]
    # = 'escape'
    user = User.find_by(username: params[:user][:username])
    if user && user.authenticate(params[:user][:password])
      token = create_token(user.id, user.username)
      render json: {status: 200, token: token, user: user}
    else
      render json: {status: 401, message: "Unauthorized - Login"}
    end
  end


  # GET /users... we don't want our user to see all logged in users:
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
    #in markdown this change is referenced w/same results as commented above:
    # render json: get_current_user
  end

  # POST /users
  def create
    # puts 'can create a user here'
    # @user = User.new(user_params)
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  #edit user
  def edit
    puts 'can i edit user please'
    @user = User.find(params[:id])
    puts 'user code worked and trying to edit from backend'
  end

  # PATCH/PUT /users/1
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect to @user
      # Handle a successful update.
    else
      render 'edit'
    end
  end


  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private

    def create_token(id, username)
      JWT.encode(payload(id, username), ENV['JWT_SECRET'], 'HS256')
    end

    def payload(id, username)
    {
      # exp: (1.day.from_now).to_i,
      exp: (Time.now + 30.minutes).to_i,
      iat: Time.now.to_i,
      iss: ENV['JWT_ISSUER'],
      user: {
        id: id,
        username: username
      }
    }
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:username, :password, :password_digest, :img, :post)
    end



end
