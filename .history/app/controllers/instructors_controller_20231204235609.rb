class InstructorsController < ApplicationController

  before_action :find_instructor, only: [:show, :update, :destroy]
  skip_before_action :authorized, only: [:create, :login, :show, :logout]

  def login #for /login
    #find by username from body
    @user = Instructor.find_by(name: params[:name])
    #check if user exists and password matches password digest
    if (@user && @user.authenticate(params[:password]))
        puts("user found")
        #create token for front end
        token = JWT.encode({user_id: @user.id}, secret_key, 'HS256')
        #pass user instance and token to front end
        render json: {user: InstructorSerializer.new(@user, include:  ['clubs', 'clubs.students']), token: token}
    end 
  end

  def create
    instructor = Instructor.create!(instructor_params)
    render json: instructor
  end

  def show
    render json: @instructor, include: ['clubs', 'clubs.students']
  end

  def me
    render json: {user: InstructorSerializer.new(@current_user, include:  ['clubs', 'clubs.students'])}, status: :ok
  end

  def update
  end

  def destroy
    @instructor.destroy!
    head :no_content
  end

  def logout 
    @current_user = nil
    head :no_content
  end 

  private 

  def find_instructor
    @instructor = Instructor.find(params[:id])
  end

  def instructor_params
    params.permit(:name, :password)
  end
end
