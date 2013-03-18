require_relative 'html_generator'

# We need to be able to access parameters passed into the app.
# Any Ruby app can be passed parameters.
# It's up to the program to decide how (or even if) to respond.

if ARGV.empty?
	puts "Usage: [args]"
else
  generator = HtmlGenerator.new
	if ARGV[0] == "index"
    generator.index
	elsif ARGV[0] == "show"
    generator.show(ARGV[1])
	else
		puts "Unrecognized action. Please refer to USAGE."
	end
end