class Friend
  def greeting(who=nil)
  	who != nil ? "Hello, #{who}!" : "Hello!"
  end
end
