require 'faker'

# A class of static test data methods

class TestData

  # All methods in this block are static
  class << self

    ########
    # Newsletter
    ########

    def email_address(type:)
      {
          :valid => Faker::Internet.email,
          :invalid => 'nevergonnaletyoudown'
      }[type.to_sym]
    end



    ######
    # Search
    ######

    def search_term(type:)
      {
          :popular => 'apple',
          :valid => 'camera'
      }[type.to_sym]
    end


    ######
    # Products
    ######

    def valid_product_path
      '/apple-macbook-pro-13-inch'
    end

  end

end