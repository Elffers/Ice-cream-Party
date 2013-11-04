### ICE CREAM PARTY PLANNER

# hash = {"Elizabeth"=>["caramel", "chocolate"], "HHH"=>["hazelnut", "vanilla"], "Anne"=>["pistachio"], "Audrey"=>["pistachio"], "Davida"=>["vanilla", "chocolate"]}
hash = {}


def add_invitee(hash)
	puts "What is your name?"
	name = gets.chomp
	puts "What is your favorite ice cream flavor?"
	flavor = gets.chomp.split(', ')
	hash[name] = flavor
	puts hash
end

add_invitee(hash)

puts "Would you like to invite more people?"
response = gets.chomp

while response[0].downcase == "y"
	add_invitee(hash)	
  puts "Would you like to add more people?"
  response = gets.chomp
end

#Report of guests listed alphabetically
def report_by_name(hash)
	names = hash.keys.sort
	names.each do |name|
		puts name.to_s + "'s favorite flavor(s) are: " + hash[name].join(', ')
	end
end

#Report of all guests who like each flavor
def report_by_flavors(hash)
	flavors = {}
	flavor_array = []	
	hash.each do |name, flavor|
		if flavor_array.include? (flavor)
			flavors[flavor].push(name)
		#checks if hash already has given flavor as a key
		#creates a list of names by retrieving key from original hash
		else
			flavors[flavor] = [name]
			flavor_array.push flavor
		end
	end
	puts flavors
end

x = true
while x
	puts "Would you like a report by name or by flavors? (input: name or flavor)"
	report = gets.chomp
	if report == "name"
		report_by_name(hash)
		x = false
	elsif report == "flavor"
		report_by_flavors(hash)
		x = false
	else
		puts "Please enter name or flavor!"	
		x = true
	end

end

