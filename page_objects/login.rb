require_relative 'page.rb'

class LoginPage < Page

  def initialize()
    super(page_path:'/login')
  end

end