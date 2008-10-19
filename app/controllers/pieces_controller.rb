class PiecesController < ApplicationController
  before_filter :login_required
  # GET /pieces
  # GET /pieces.xml
  def index
    if admin?
      @pieces = Piece.find(:all)
    else
      if (params[:title_id])
        @pieces = Piece.find(:all, :conditions => ['title_id=?' , params[:title_id]])
      else
        if (params[:ftt_id])
            if Piece.find_by_id(params[:ftt_id])!=nil
              tpiece=Piece.find_by_id(params[:ftt_id])
              ttitle=tpiece.title.id
              tpieces = Piece.find(:all, :conditions => ['title_id=?', ttitle])
              tusers = Hash.new
              ttpieces=Array.new
              tpieces.each {|p| tusers[p.user.id] = p.category.id if p.user.id != current_user.id}
              tusers.each {|userkey, categorykey| User.find_by_id(userkey).pieces.each { |p| ttpieces.push(p) if p.category.id != categorykey } }
              @pieces = ttpieces
            end
        else
          if (params[:fet_id])
            if Piece.find_by_id(params[:fet_id]) != nil
              tpiece=Piece.find_by_id(params[:fet_id])
              ttitle=tpiece.title.id
              tpieces = Piece.find(:all, :conditions => ['title_id=?', ttitle])
              tusers = Hash.new
              ttpieces=Array.new
              tpieces.each {|p| tusers[p.user.id] = p.category.id if p.user.id != current_user.id}
              tusers.each {|userkey, categorykey| User.find_by_id(userkey).pieces.each { |p| ttpieces.push(p) if p.category.id == categorykey } }
              @pieces = ttpieces
            end
            else
              @pieces = Piece.find(:all, :conditions => ['user_id=?' , current_user.id])
            end
        end
      end
    end
    respond_to do |format|
      @pieces.sort {|x,y| x.title.name <=> y.title.name }
      format.html # index.html.erb
      format.xml  { render :xml => @pieces }
    end
  end

  # GET /pieces/1
  # GET /pieces/1.xml
  def show
    @piece = Piece.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @piece }
    end
  end

  # GET /pieces/new
  # GET /pieces/new.xml
  def new
    @piece = Piece.new
    @piece.user = current_user
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @piece }
    end
  end

  # GET /pieces/1/edit
  def edit
    @piece = Piece.find(params[:id])
  end

  # POST /pieces
  # POST /pieces.xml
  def create
    @piece = Piece.new(params[:piece])

    respond_to do |format|
      if @piece.save
        flash[:notice] = 'Piece was successfully created.'
        format.html { redirect_to  :controller => "users", :action => "show", :id => current_user  }
        format.xml  { render :xml => @piece, :status => :created, :location => @piece }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @piece.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pieces/1
  # PUT /pieces/1.xml
  def update
    @piece = Piece.find(params[:id])

    respond_to do |format|
      if @piece.update_attributes(params[:piece])
        flash[:notice] = 'Piece was successfully updated.'
        format.html { redirect_to  pieces_path }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @piece.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pieces/1
  # DELETE /pieces/1.xml
  def destroy
    @piece = Piece.find(params[:id])
    @piece.destroy

    respond_to do |format|
      format.html { redirect_to(pieces_url) }
      format.xml  { head :ok }
    end
  end
  
  def ftt
    tpiece=Piece.find_by_id(16)
    ttitle=tpiece.title.id
    tpieces = Piece.find(:all, :conditions => ['title_id=?', ttitle])
    tusers = Hash.new
    ttpieces=Array.new
    tpieces.each {|p| tusers[p.user.id] = p.category.id if p.user.id != current_user.id}
    tusers.each {|userkey, categorykey| User.find_by_id(userkey).pieces.each { |p| ttpieces.push(p) if p.category.id != categorykey } }
  end
end
