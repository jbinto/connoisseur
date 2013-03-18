require 'open-uri'
require 'json'

# note: Style guide dictates not calling this class HTMLGenerator.

class HtmlGenerator
  def show
    print_header
    puts "Action: show"
    print_footer
  end

  def index
    print_header
    json = retrieve_data
    json["result"].each do |result|
      print_product(result)
    end

    print_footer
  end

  # Consider that some HTML will be common to all documents, so
  # let's write some shared methods for these.

  # Mark the following methods internal to the class.
  private             
  def print_header
    puts "<!doctype html>"
    puts "<html>"
    puts "  <head>"
    puts "    <title>Connoisseur</title>"
    puts "  </head>"
    puts "  <body>"
  end
    
  def print_footer
    puts "  </body>"
    puts "</html>"
  end

  def print_product(product)
    puts "<p>#{product["name"]}</p>"
    puts "<p>$#{product["price_in_cents"].to_f / 100.0}</p>"
  end

  def retrieve_data
    response = open("http://lcboapi.com/products.json").read
    json = JSON.parse(response)
  end
end