class PagesController < ApplicationController
  
  # GET /
  def index
    @pages = Page.select("name, id")
    @page = Page.where(:order ).first
  end

  # GET /page/1
  # GET /page/1.json
  def show
    @pages = Page.all
    @page = Page.find(params[:id])
    
    #we redirect first page to root
    if @page.order==1
      redirect_to :root
    end
  end
  
  def new
    @pages = Page.all
    @page = Page.new
  end

  def create
    @pages = Page.all
    @page = Page.new(params[:page])
    if @page.save
      flash[:notice] = "page created"
      redirect_to :root
    else
      render action: :new
    end
  end
  
  def edit
    @pages = Page.all
    @page = Page.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update_attributes(params[:book])
      flash[:notice] = "Book saved"
      redirect_to book_path(@book)
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
