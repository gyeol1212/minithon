class HomeController < ApplicationController
  def index
    @checks = Check.all
    @checks_sort = @checks.sort
  end

  def mypage
    @checks =Check.all
    


  end

  def ok
    @check=Check.find(params[:check_id])
    @check.money = 1
    @check.save

    redirect_to :back
  end

  def no
    @check=Check.find(params[:check_id])
    @check.money = 2
    @check.save

    redirect_to :back
  end

  def edit
    @check=Check.find(params[:check_id])
  end

  def destroy
    @check=Check.find(params[:check_id])
    @check.destroy

    redirect_to '/'
  end

  def create
    content=params[:gets]
    names = content.split('').join.split(',')

    names.each do |name|
      @check = Check.new
      @check.name = name
      @check.save  
    end
    redirect_to '/'
  end

end
