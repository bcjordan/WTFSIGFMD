class GiftsController < ApplicationController
  def index
    @gifts = Gift.all
  end

  def random
    @cheap = params[:cheapbastard]

    if @cheap && (@cheap.to_i <= 11) # minimum cheapness
      @incrediblycheap = true      # change link to raise price rather than lower
      @cheap = 12                   # set cheapness to 11 dollars
    end

    @cheap = 500 unless @cheap

    @gift = Gift.find :first, :order => "RANDOM() DESC", 
                      :conditions => ["price <= ?", @cheap.to_i * 100]

    @cheap = nil if @cheap == 500 # Want empty link
  end

  def show
    @gift = Gift.find(params[:id])
  end

  def new
    @gift = Gift.new
  end

  def create
    @gift = Gift.new(params[:gift]) # TODO: comment out or authenticate
    if @gift.save
      redirect_to @gift, :notice => "Successfully created gift." # Taunt
    else
      render :action => 'new'
    end
  end

  def edit
    @gift = Gift.find(params[:id])
  end

  def update
    @gift = Gift.find(params[:id])
    if @gift.update_attributes(params[:gift]) # TODO: comment out / auth
      redirect_to @gift, :notice  => "Successfully updated gift." # Taunt
    else
      render :action => 'edit'
    end
  end

  def destroy
    @gift = Gift.find(params[:id])
    @gift.destroy # TODO: comment out or authenticate
    redirect_to gifts_url, :notice => "Successfully destroyed gift." # Taunt
  end
end
