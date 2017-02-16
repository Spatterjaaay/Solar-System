class Planet
  attr_reader :name, :position, :type, :moons, :rings, :orbit, :distance_from_the_sun
  # initializes attributes of each instance of a planet
  def initialize(planet_hash)
    @name = planet_hash[:name]
    @position = planet_hash[:position]
    @moons = planet_hash[:moons]
    @type = planet_hash[:type]
    @rings = planet_hash[:rings]
    @orbit = planet_hash[:orbit]
    @distance_from_the_sun = planet_hash[:distance]
  end
  # prints information about a specific planet
  def print_info
    puts "Here are some basic facts about #{@name}: \nIt has #{@moons} moon(s)."
    puts "It is an #{@position}, #{@type} type planet. It has #{@rings}."
    puts "It's solar orbit period is #{@orbit} Earth days."
    puts "And it's distance from the sun is #{@distance_from_the_sun} million km."
  end
  # calculates distance between planets
  # .abs makes the value absolute (no neg numbers)
  def distance_from(planet_2)
    (@distance_from_the_sun - planet_2.distance_from_the_sun).abs
  end
end

# array of hashes that are initialized as instances of Planet class
planet_array = [
  Planet.new(
  { name: "Mercury",
    position: "inner",
    moons: 0,
    type: "terrestrial",
    rings: "no rings",
    orbit: 88,
    distance: 58
  }),
  Planet.new(
  {
    name: "Venus",
    position: "inner",
    moons: 0,
    type: "terrestrial",
    rings: "no rings",
    orbit: 225,
    distance: 108
  }),
  Planet.new(
  {
    name: "Earth",
    position: "inner",
    moons: 1,
    type: "terrestrial",
    rings: "no rings",
    orbit: 365,
    distance: 150
  }),
  Planet.new(
  {
    name: "Mars",
    position: "inner",
    moons: 2,
    type: "terrestrial",
    rings: "no rings",
    orbit: 689,
    distance: 230
  }),
  Planet.new({
    name: "Jupiter",
    position: "outer",
    moons: 63,
    type: "gas giant",
    rings: "rings",
    orbit: 4333,
    distance: 778
  }),
  Planet.new({
    name: "Saturn",
    position: "outer",
    moons: 62,
    type: "gas giant",
    rings: "rings",
    orbit: 10759,
    distance: 1400
  }),
  Planet.new({
    name: "Uranus",
    position: "outer",
    moons: 27,
    type: "ice giant",
    rings: "rings",
    orbit: 30689,
    distance:3000
  }),
  Planet.new({
    name: "Neptune",
    position: "outer",
    moons: 14,
    type: "ice giant",
    rings: "rings",
    orbit: 60182,
    distance: 4500
  })
]
# planet option to choose from for the user
puts "Welcome to our Planetopedia!"
puts "These are your planet options:"
planet_array.length.times { |n| puts "#{n + 1} " + planet_array[n].name }

# asks user to choose a planet
while true
  puts "Select the number of the planet you would like to know about: "
  selection = gets.chomp.to_i
  # creates an instance of a planet
  planet = (planet_array[selection - 1])
  # prints information about a selected planet
  planet.print_info
  puts "\nWould you like to continue? y/n"
  answer = gets.chomp
  break if answer != "y"
end

class Solar_System
  attr_reader :name, :formation_year
  attr_accessor :planets
  def initialize(name_input, formation_year_input)
    @name = name_input
    @planets = []
    @formation_year = formation_year_input
  end

  # adding one planet
  # def add_planet(planet)
  #   @planets.push(planet)
  #   puts "you just added #{planet.name}."
  # end

  #adding a list of planets
  def add_planets(planet)
    planet.each do |planet|
      @planets << planet
    end
  end


  def local_year(planet)
    @formation_year / planet.orbit
  end

end

milky_way = Solar_System.new("Milky Way", 10000000)

milky_way.add_planets(planet_array)

puts "These are the planets inside Milky Way:"
milky_way.planets.length.times { |n| puts "#{n + 1} " + milky_way.planets[n].name }

puts "Select the numbers of the planets you would like to compare: "
puts "First planet: "
first_choice = gets.chomp.to_i
puts "Second planet: "
second_choice = gets.chomp.to_i

# calculates the distance between the first two planets added to the @planets array
interplanetary_distance = milky_way.planets[first_choice - 1].distance_from(milky_way.planets[second_choice - 1])
puts "The distance between #{milky_way.planets[first_choice - 1].name} and #{milky_way.planets[second_choice - 1].name} is #{interplanetary_distance} million km."

puts "insert the number of the planet you want to know age of: "
third_choice = gets.chomp.to_i
# calculates age of a planet that user selected
planet_age = milky_way.local_year(milky_way.planets[third_choice - 1])
puts "The selected planet is #{planet_age} years old."
