class ResumePolicy < ApplicationPolicy


  def index?
    internal_users || vendor
  end

  def new?
    create?
  end

  def create?
    interviewee
  end

  def edit?
    update?
  end

  def update?
    interviewee
  end

  def destroy?
    interviewee
  end




  












  class Scope < Scope
  end
end
