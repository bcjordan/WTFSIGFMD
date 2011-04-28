class ClicksController < ApplicationController
  # GET /clicks
  # GET /clicks.xml
  def index
    @clicks = Click.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @clicks }
    end
  end

  # GET /clicks/1
  # GET /clicks/1.xml
  def show
    @click = Click.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @click }
    end
  end

  # GET /clicks/new
  # GET /clicks/new.xml
  def new
    @click = Click.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @click }
    end
  end

  # GET /clicks/1/edit
  def edit
    @click = Click.find(params[:id])
  end

  # POST /clicks
  # POST /clicks.xml
  def create
    @click = Click.new(params[:click])        
    @click.request_ip = request.remote_addr
    @click.user_agent = request.user_agent #request.env['HTTP_USER_AGENT']
    @click.user_id = cookies[:uid]

    @click.save

    render :layout => false
=begin    
    respond_to do |format|
      if @click.save
        format.html { redirect_to(@click, :notice => 'Click was successfully created.') }
        format.xml  { render :xml => @click, :status => :created, :location => @click }
        format.js { render :json => @click }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @click.errors, :status => :unprocessable_entity }
        format.js { render :json => @click.errors }
      end
    end
=end
  end

  # PUT /clicks/1
  # PUT /clicks/1.xml
  def update
    @click = Click.find(params[:id])

    respond_to do |format|
      if @click.update_attributes(params[:click])
        format.html { redirect_to(@click, :notice => 'Click was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @click.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /clicks/1
  # DELETE /clicks/1.xml
  def destroy
    @click = Click.find(params[:id])
    @click.destroy

    respond_to do |format|
      format.html { redirect_to(clicks_url) }
      format.xml  { head :ok }
    end
  end
end
