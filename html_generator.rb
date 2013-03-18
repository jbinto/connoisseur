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
    puts '    <link href="connoisseur.css" rel="stylesheet" type="text/css">'
    puts "  </head>"
    puts "  <body>"
    puts "    <h1>Connoisseur</h1>"
  end
    
  def print_footer
    puts "  </body>"
    puts "</html>"
  end

  def print_product(product)
    puts "<div>"
    puts "<h2>#{product["name"]}</h2>"
    if product["image_url"]
      puts "<img src=\"#{product["image_url"]}\" width=100 height=100>"
    end
    puts "<ul>"
    puts "  <li><strong>Price:</strong> $#{cents_to_dollars(product["price_in_cents"])}</li>"
    puts "  <li><strong>Format:</strong> #{product["package"]}</li>"
    puts "  <li><strong>Categories:</strong> #{product["primary_category"]} / #{product["secondary_category"]} / #{product["tertiary_category"]} </li>"
    puts "  <li><strong>Product number:</strong> #{product["product_no"]}</li>"
    puts "</ul>"
    puts "</div>"
  end

  def retrieve_data
    response = open("http://lcboapi.com/products.json/?where_not=is_beer").read
    json = JSON.parse(response)
  end

  def cents_to_dollars(cents)
    cents.to_f / 100
  end
end