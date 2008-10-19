class InterpretsController < ApplicationController
before_filter :login_required
  # GET /interprets
  # GET /interprets.xml
  def index
    @interprets = Interpret.find(:all, :conditions => ['name LIKE ?' , "%#{params[:search]}%"])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @interprets }
      format.js
    end
  end

  # GET /interprets/1
  # GET /interprets/1.xml
  def show
    @interpret = Interpret.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @interpret }
      format.js
    end
  end

  # GET /interprets/new
  # GET /interprets/new.xml
  def new
    @interpret = Interpret.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @interpret }
    end
  end

  # GET /interprets/1/edit
  def edit
    @interpret = Interpret.find(params[:id])
  end

  # POST /interprets
  # POST /interprets.xml
  def create
    @interpret = Interpret.new(params[:interpret])

    respond_to do |format|
      if @interpret.save
        flash[:notice] = 'Interpret was successfully created.'
        format.html { redirect_to(@interpret) }
        format.xml  { render :xml => @interpret, :status => :created, :location => @interpret }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @interpret.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /interprets/1
  # PUT /interprets/1.xml
  def update
    @interpret = Interpret.find(params[:id])

    respond_to do |format|
      if @interpret.update_attributes(params[:interpret])
        flash[:notice] = 'Interpret was successfully updated.'
        format.html { redirect_to(@interpret) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @interpret.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /interprets/1
  # DELETE /interprets/1.xml
  def destroy
    @interpret = Interpret.find(params[:id])
    @interpret.destroy

    respond_to do |format|
      format.html { redirect_to(interprets_url) }
      format.xml  { head :ok }
    end
  end
end
