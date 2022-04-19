class ResumesController < ApplicationController
  before_action :find_resume, only: [:show]

  before_action :find_my_resume, only: [:edit, :update, :destroy, :show]

  before_action :authenticate_user, except: [:index, :show]

  def index
    # flash[:notice] = "123"
    @resumes = Resume.published
    #render file: "../views/resumes/index.html.erb" default
  end

  def my 
    @resumes = current_user.resumes
  end

  def new
    @resume = Resume.new
  end 

  def create
    # @resume = Resume.new(resume_params) #先做resume指定他的user.id 
    # @resume.user.id = current_user.id
    # @resume.user = current_user

    @resume = current_user.resumes.new(resume_params) #從使用者角度創造履歷

    if @resume.save
      # flash[:notice] = "新增成功"
      # render html: params
      redirect_to resumes_path, notice: "新增成功"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @resume.update(resume_params)
      redirect_to resumes_path, notice: "修改成功"
    else
      render :edit
    end
  end

  def destroy
    @resume.destroy
      redirect_to resumes_path, notice: "已刪除"
  end


  private
    # Strong Parameters
  def resume_params
    params.require(:resume).permit(:title, :content, :status)
  end

  def find_resume
    # @resume = Resume.find(params[:id])
    if current_user
      current_user.resumes
    else
      @resume = Resume.published.find(params[:id])   
    end

  end
  
  def find_my_resume
    @resume = current_user.resumes.find(params[:id])
  end
end
