class SubjectsController < ApplicationController

  layout false

  def index
    @subjects = Subject.sorted
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new(:visible => false)
  end

  def create
    #Instantaite a new object
    @subject = Subject.new(subject_params)
    # savwe it
    if @subject.save
      redirect_to(:action => 'index') #redirect_to the index
    else
      render('new') #redisplay the form so user can fix problems
    end
  end

  def edit
    @subject = Subject.find_by_id(params[:id])
  end

  def update
    @subject = Subject.find_by_id(params[:id])

    if @subject.update(subject_params)
      redirect_to(:action => 'show', :id => @subject.id) #redirect_to the index
    else
      render('edit') #redisplay the form so user can fix problems
    end
  end

  def delete
  end

  def destory
  end

  private
    def subject_params
      params.require(:subject).permit(:name, :position, :visible)
    end

end
