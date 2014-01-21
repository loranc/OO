class Dessert

attr_reader :name, :calories

  def initialize(name, calories)
    @name = name
    @calories = calories

  end 
  
  def healthy?
    if calories < 200
      return true
    else
    end
  end
  
  def delicious?
    return true
  end
  
end



class JellyBean < Dessert

attr_reader :flavor

  def initialize(name, calories, flavor)
    super(name, calories)
    @flavor = flavor
  end
  
  def delicious?
    if @flavor == "black licorice"
      return false
    end
  end

end

# Testing your code 
jelly = JellyBean.new("jelly bean", 30, "black licorice")
puts jelly.healthy? == true # => true : it inherits healthy? method from the Dessert class
puts jelly.delicious? == false # => true : delicious is over-ridden by the children class implementation !