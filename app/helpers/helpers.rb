class Helpers
#  current_user = user.active
def self.current_user(session_hash)
  #if
     @user = User.find(session_hash[:user_id])
  #    return true 
   # else
   #   "you are not connected!"
  #  end
  end

  def self.is_logged_in?(session_hash)
    !!session_hash[:user_id]
  end
end