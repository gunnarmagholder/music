class MessagesController < ApplicationController
  # GET /messages
  # GET /messages.xml
  def index
    logger.debug("Entering Message index" )
    @messages = Message.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @messages }
    end
  end

  # GET /messages/1
  # GET /messages/1.xml
  def show
    logger.debug("Entering Message show" )
    @message = Message.find(params[:id])
      if (@message.recv_user == current_user.id) or (@message.sent_user == current_user.id)
        @message.read = true
        @message.save
        respond_to do |format|
          format.html # show.html.erb
          format.xml  { render :xml => @message }
        end
      else
        flash[:error] = 'This message does not belong to you!'
        redirect_to home_path
      end
  end

  # GET /messages/new
  # GET /messages/new.xml
  def new
    logger.debug("Entering Message new" )
    @message = Message.new
    @message.sent_user = current_user.id
    @message.recv_user = params[:receiver]
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @message }
    end
  end

  # GET /messages/1/edit
  def edit
    @message = Message.find(params[:id])
  end

  # POST /messages
  # POST /messages.xml
  def create
    logger.debug("Entering Message create" )
    @message = Message.new(params[:message])
    @message.read = false
    respond_to do |format|
      if @message.save
        flash[:notice] = 'Message was successfully sent.'
        format.html { redirect_to  :controller => "users", :action => "show", :id => current_user.id  }
        format.xml  { render :xml => @message, :status => :created, :location => @message }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @message.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /messages/1
  # PUT /messages/1.xml
  def update
    @message = Message.find(params[:id])

    respond_to do |format|
      if @message.update_attributes(params[:message])
        flash[:notice] = 'Message was successfully updated.'
        format.html { redirect_to(@message) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @message.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.xml
  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    respond_to do |format|
      format.html { redirect_to(messages_url) }
      format.xml  { head :ok }
    end
  end
end
