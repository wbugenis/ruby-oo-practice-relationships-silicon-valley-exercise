require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

s1=Startup.new("S1", "s1.com", "Jimmy")
s2=Startup.new("S2", "s2.com", "Chris")

v1=VentureCapitalist.new("Richboi", 2_000_000_000)
v2=VentureCapitalist.new("Poorston", 250_000)
v3=VentureCapitalist.new("Gill Bates", 10_000_000_000)
v4=VentureCapitalist.new("Justshy", 950_000_000)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line