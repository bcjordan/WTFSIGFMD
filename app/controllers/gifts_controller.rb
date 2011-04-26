class GiftsController < ApplicationController
  def index
    @gifts = Gift.all
  end

  def random
    # Consider already-seen gifts
    # Save price range
    # Pick random gift from Gift.all 
    cheap = params[:cheapbastard]
    if (cheap.nil?)
      cheap = 100*1000 - 1
    else
      cheap = Integer(cheap)*100 - 1
    end
    puts "Cheap: "
    puts cheap
    @gift = Gift.find :first, :order => "RANDOM() DESC", :conditions => ["price < ?", cheap]
    if (@gift.nil?)
      redirect_to "/youMustNotLoveYourMom/"
    end
  end

  def show
    @gift = Gift.find(params[:id])
  end

  def new
    @gift = Gift.new
  end

  def create
    @gift = Gift.new(params[:gift])
    if @gift.save
      redirect_to @gift, :notice => "Successfully created gift."
    else
      render :action => 'new'
    end
  end

  def edit
    @gift = Gift.find(params[:id])
  end

  def update
    @gift = Gift.find(params[:id])
    if @gift.update_attributes(params[:gift])
      redirect_to @gift, :notice  => "Successfully updated gift."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @gift = Gift.find(params[:id])
    @gift.destroy
    redirect_to gifts_url, :notice => "Successfully destroyed gift."
  end
end
