# We need to be able to access parameters passed into the app.
# Any Ruby app can be passed parameters.
# It's up to the program to decide how (or even if) to respond.

if ARGV.empty?
	puts "Usage: [args]"
else
	puts "Arguments passed in: #{ARGV.join(" ")}"
end