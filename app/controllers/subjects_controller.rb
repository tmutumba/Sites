class SubjectsController < ApplicationController

  layout "admin"

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
      flash[:notice] = "Subject created successfully"
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
      flash[:notice] = "Subject updated successfully"
      redirect_to(:action => 'show', :id => @subject.id) #redirect_to the index
    else
      render('edit') #redisplay the form so user can fix problems
    end
  end

  def delete
    @subject = Subject.find_by_id(params[:id])
  end

  def destory
    subject = Subject.find_by_id(params[:id]).destroy
    flash[:notice] = "Subject destoryed successfully"
    redirect_to(:action => 'index')
  end

  private
    def subject_params
      params.require(:subject).permit(:name, :position, :visible)
    end

end
