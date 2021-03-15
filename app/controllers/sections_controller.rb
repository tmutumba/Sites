class SectionsController < ApplicationController

  layout "admin"

  def index
    @sections = Section.sorted
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new(:name => "Default")
  end

  def create
    @section = Section.new(page_params)

    if @section.save
      flash[:notice] = "Section created successfully"
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def edit
    @section = Section.find_by_id(params[:id])
  end

  def update
    @section = Section.find_by_id(params[:id])

    if @section.update(page_params)
      flash[:notice] = "Section is updated now"
      redirect_to(:action => 'show', :id => @page.id)
    else
      render('edit')
    end
  end

  def delete
    @section = Section.find_by_id(params[:id])
  end

  def destory
    @section = Section.find_by_id(params[:id]).destroy
    flash[:notice] = "Section '#{section.name}' destroyed successfully"
  end

  private
    def page_params
      params.require(:section).permit(:page_id, :name, :position, :visible,
      :content_type, :content)
    end
end
