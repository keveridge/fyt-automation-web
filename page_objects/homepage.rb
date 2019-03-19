require_relative 'page.rb'

class HomePage < Page

  def initialize()
    super(page_path:'/')
  end

end