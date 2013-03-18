# We need to be able to access parameters passed into the app.
# Any Ruby app can be passed parameters.
# It's up to the program to decide how (or even if) to respond.

p ARGV[0]
p ARGV[1]
p ARGV[2]
p ARGV[3]

# The convention is, if the program requires arguments, if it's
# called without any, we show the usage.