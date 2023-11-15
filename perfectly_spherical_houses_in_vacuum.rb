# OBJECTIVE: How many houses receive at least one present?  --> i.e. on the total of houses (sites = steps) how many he visits?
# PATTERNS:
# 1. '>' delivers presents to 2 houses: one at the starting location, and one to the east
# 2. '^>v<' delivers presents to 4 houses in a square, including twice to the house at his starting/ending location.
# 3. '^v^v^v^v^v' delivers many presents at only 2 houses

# generate the infinite 2D grid. Since you can't create and infinte object with a finite piece of memory, you can either create a very big one hoping that the size will be enough, or just create pacman border conditions (i.e. I am folding the 2D grid plane into a sphere and i'm moving on the surface of the sphere). That is, grid [0][0] = grid[MAX_SIZE][MAX_SIZE] etc in all the 4 directions.

# what is MAX_SIZE?

# populate the grid with 0 and increase site by 1 whenever santa visits the site.

# He begins by delivering a present to the house at his starting location
# start at grid[0][0] and make the site go from 0 -> 1

# Moves are always exactly one house to the north (^), south (v), east (>), or west (<)
# After each move, he delivers a present to the house at his new location
# follow moves on the file and increase the site's number accordingly.

# count sites where > 1
# ---------------------------------------------------------------------------------
# Alternative solution (less computationally demanding)

# read file char by char

# recognize the patterns as they come into the file

# assign to each pattern a number of houses visited

# return total number of houses visited

# add +1 at the end for the initial house
