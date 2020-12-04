class BillboardsController < ApplicationController
  def index
    @billboards = Billboard.all 
  end

  def show
    @billboard = Billboard.find(params[:id])
  end

  def new
    @billboard = Billboard.new
    render partial: 'form' # pertains to views, partial is a shared view, reuse over and over again 
  end
  
  def create #place next to new, added
    @billboard = Billboard.new(billboard_params)
    if @billboard.save
      redirect billboards_path
    else
      render :new
    end
  end

  def edit #do this before update
    @billboard = Billboard.find(params[:id])
    render partinal: 'form' # pertains to views, partial is a shared view, reuse over and over again (you should find it views)
  end

  def update #added
    @billboard = Billboard.find(params[:id])
    if @billboard.update(billboard_params)
      redirect billboards_path
    else
      render :edit
    end
  end 

  def destroy #added 
    billboard.find(params[:id]).destroy
    redirect billboards_path
  end

  private #added
  def billboard_params
    params.require(:billboard).permit(:title, :description)
  end
end
