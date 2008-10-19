class Message < ActiveRecord::Base
  
  def sender_name
    User.find_by_id(sent_user).login
  end
  
  def receiver_name
    User.find_by_id(recv_user).login
  end
end
