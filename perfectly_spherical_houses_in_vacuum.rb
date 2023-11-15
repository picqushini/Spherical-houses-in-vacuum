# Define a method returns the coordinated of Sant's new position on the grid after moving the sleigh in a given direction
def move_sleigh(initial_coordinates, direction)
  case direction

  when '^' then initial_coordinates.zip([0,1]).map {  |a, b| a + b }
  when 'v' then initial_coordinates.zip([0,-1]).map {  |a, b| a + b }
  when '>' then initial_coordinates.zip([1,0]).map {  |a, b| a + b }
  else initial_coordinates.zip([-1,0]).map {  |a, b| a + b }
  end

end

# Santa moves on an infite 2D grid, with origin at his starting point (x0, y0).
# In this program I am not representing the grid, but just the coordinates of the houses visited by Santa.
# The hash has the following structure: visited_houses = {x1: {y1: value, y2: value}, x2: {y1: value, y2: value}}

# Create a hash to keep track of visited houses
visited_houses = Hash.new { |hash, key| hash[key]  = Hash.new(0) }

# Initial coordinates for Santa
(x0,y0) = 0, 0
initial_coordinates = x0, y0
# Mark the starting house as visited
visited_houses[x0][y0] += 1

# Import file containing directions for Santa
directions_file = './input.txt'
# Open the file and process each direction
File.open(directions_file, 'r') do |file|
  puts '🛷 Flying around the world...'
  # Assign the first character of the file to the direction variable
  direction = file.getc
  while ['^', 'v', '>', '<'].include? direction
    # Move the sleigh and get new coordinates
    new_coordinates = move_sleigh(initial_coordinates, direction)
    # Mark the new house as visited
    visited_houses[new_coordinates[0]][new_coordinates[1]] += 1
    # Update the initial coordinates for the next move
    initial_coordinates = new_coordinates
    # Read the next direction from the file
    direction = file.getc
  end
end

# Count the number of houses that received at least one present
houses_with_present = visited_houses.values.sum(&:length)

puts "🎁☃️    #{houses_with_present} houses received at least one present from Santa!    🎁☃️"
