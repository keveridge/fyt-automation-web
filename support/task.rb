require_relative 'testdata'

class Task

  def self.get_product_page
    ProductDetailPage.new(page_path: TestData.valid_product_path)
  end

  def self.validate_table(page:, table:, method_hash:)
    table.raw.each do |row|
      raise "Could not find `#{row.first}`" unless page.send(method_hash[row.first])
    end
  end

end