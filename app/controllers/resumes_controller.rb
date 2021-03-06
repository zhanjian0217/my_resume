class ResumesController < ApplicationController
  before_action :find_resume, only: [:show]
  before_action :find_my_resume, only: [:edit, :update, :destroy, :pin]
  before_action :authenticate_user, except: [:index, :show]


  def pin 
    current_user.resumes.update_all(pinned: false)
    @resume.update(pinned: true)
    redirect_to my_resumes_path, notice: "已設定預設履歷"
  end



  def index
    @resumes = Resume.published
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
    params.require(:resume).permit(:title, :content, :status, :mugshot)
  end

  def find_resume
    # @resume = Resume.find(params[:id])
    if user_signed_in?
      find_my_resume
    else
      @resume = Resume.published.friendly.find(params[:id])   
    end

  end
  
  def find_my_resume
    @resume = current_user.resumes.friendly.find(params[:id])
  end
end
