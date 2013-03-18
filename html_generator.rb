# note: Style guide dictates not calling this class HTMLGenerator.

class HtmlGenerator
  def show
    print_header
    puts "Action: show"
    print_footer
  end

  def index
    print_header
    puts "Action: index"
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
end