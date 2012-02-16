class PagesController < ApplicationController
  
  before_filter :check_pages
  
  def check_pages
  	@pages = Page.select("name, id")
    if @pages.empty? and params[:page].nil?
      flash[:notice] = "No pages created, create one to get started"
      @page = Page.new
      render action: :new
    end
  end
  
  # GET /
  def index
    @page = Page.all.first
  end

  # GET /page/1
  # GET /page/1.json
  def show
    @page = Page.find(params[:id])
    
    #we redirect first page to root
    if @page.order==1
      redirect_to :root
    end
  end
  
  def new
    @page = Page.new
  end

  def create
    @page = Page.new(params[:page])
    if @page.save
      flash[:notice] = "page created"
      redirect_to :root
    else
      render action: :new
    end
  end
  
  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(params[:page])
      flash[:notice] = "Page saved"
      redirect_to page_path(@page)
    else
      render action: :edit
    end
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    flash[:notice] = "Page deleted"
    redirect_to pages_path
  end

end
