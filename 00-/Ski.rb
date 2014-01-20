class Ski
  # Instance method called when creating objects
  attr_accessor :model, :brand, :size, :gender
  
  def initialize(model, brand, size, gender) 
    @model = model
    @brand = brand
    @size = size
    @gender = gender
    @usure = 0
    @use_ratio = 5.0
  end

  def ski_one_day
    @usure += @use_ratio 
    puts "quel kif ce jour de ski !"
  end


  def ski_for(number_day)
    @usure = number_day * @use_ratio 
    puts "pfiou.. eprouvant ces #{number_day} jours de ski"
  end

  def state
    if @usure > 100
      "tes ski sont morts! change tes skis"
    else
      "super skis, ils se portent comme des charmes"
    end
  end


end

collection_K2_2014 = Ski.new("Annex 118", "K2", "108", "m")

puts "au top mes nvaux ski #{collection_K2_2014.model} de #{collection_K2_2014.brand}"

collection_K2_2014.ski_for(20)

puts collection_K2_2014.state

collection_K2_2014.ski_one_day

puts collection_K2_2014.state





