class PagesController < ApplicationController

  layout "admin"

  def index
    @pages = Page.sorted
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new(:name => "Default")
  end

  def create
    @page = Page.new(page_params)

    if @page.save
      flash[:notice] = "Page created successfully"
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def edit
    @page = Page.find_by_id(params[:id])
  end

  def update
    @page = Page.find_by_id(params[:id])

    if @page.update(page_params)
      flash[:notice] = "Page is updated now"
      redirect_to(:action => 'show', :id => @page.id)
    else
      render('edit')
    end
  end

  def delete
    @page = Page.find_by_id(params[:id])
  end

  def destory
    @page = Page.find_by_id(params[:id]).destroy
    flash[:notice] = "Page '#{page.name}' destroyed successfully"
  end

  private

    def page_params
      params.require(:page).permit(:subject_id, :name, :permalink,
         :position, :visible)
    end
end
