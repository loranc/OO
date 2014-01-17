class OrangeTree
  
  def initialize(height = 0)
    # Initialize an OrangeTree object
    @age = 0
    @height = height
    @totalorange = 0
    @dead = false
  end
  
  def measure_height
    # Gives the height of the tree if alive
    @height
    if @dead == true
      puts "The orange tree is dead!"
    else
      puts "Your orange tree measures #{@height} meters"
    end
  end
  
  def count_the_oranges
    # Count the oranges of the tree if alive
    if @totalorange <= 0
      "theres is no orange on your tree anymore" 
    elsif @dead == true
      "Your tree is dead, i won't be able to produce orange anymore"
    else
    @totalorange
    end
  end
  
  def pick_an_orange(numbers)
    # Pick an orange to the tree
    if numbers > @totalorange
      puts "There is not enough oranges on the tree"
    else
      @totalorange -= numbers
    end
  end

  def one_year_passes!
    # Main logic goes here
    @age += 1
    @totalorange = rand(100..120) + @age/5
    @height += 0.6 + (0.3/(@age))
    if @age > 60 
      @dead = true
    end 
  end

end

orangetree_1 = OrangeTree.new(0.8)
puts 58.times { orangetree_1.one_year_passes! }
puts orangetree_1.measure_height

n = 200
puts "You have produce #{orangetree_1.count_the_oranges} oranges. You pick #{n} delicious oranges. 
There still are #{orangetree_1.pick_an_orange(n)} oranges"