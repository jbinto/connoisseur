require 'open-uri'
require 'json'

# note: Style guide dictates not calling this class HTMLGenerator.

class HtmlGenerator
  def show(id)
    print_header
    json = retrieve_data("http://lcboapi.com/products/#{id}")
    print_product(json["result"])
    print_footer
  end

  def index
    print_header
    json = retrieve_data("http://lcboapi.com/stores/10/products?q=islay&page=2")
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
      src = product["image_url"]
    else
      src = "http://upload.wikimedia.org/wikipedia/en/a/af/Question_mark.png"
    end
    puts "<img src=\"#{src}\" width=100 height=100>"
    puts "<ul>"
    puts "  <li><strong>Price:</strong> $#{cents_to_dollars(product["price_in_cents"])}</li>"
    puts "  <li><strong>Format:</strong> #{product["package"]}</li>"
    puts "  <li><strong>Categories:</strong> #{product["primary_category"]} / #{product["secondary_category"]} / #{product["tertiary_category"]} </li>"
    puts "  <li><strong>Product number:</strong> #{product["product_no"]}</li>"
    puts "</ul>"
    puts "</div>"
  end

  def retrieve_data(url)
    response = open(url).read
    json = JSON.parse(response)
  end

  def cents_to_dollars(cents)
    cents.to_f / 100
  end
end