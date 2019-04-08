require_relative 'page.rb'

class Apparel < Page

  def initialize()
    super(page_path:'/apparel')
  end
end
