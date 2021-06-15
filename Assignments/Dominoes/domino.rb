class Domino

  attr_reader :top, :bottom

  def self.get_double_six_set
    set = []

    for i in 0..6
      for j in 0..i
        set << Domino.new(j, i)
      end
    end
    return set
  end

  def initialize(top, bottom)
    if top < 0 || bottom < 0
      raise "Values cannot be less than 0."
    end
    if top > 6 || bottom > 6 
      raise "Values cannot be greater than 6."
    end
    @top = top
    @bottom = bottom
  end

  def to_s
    divider = "+-----+"

    def create_face(dots)
      top_rows = ["|     |", "|     |", "|*    |", "|*    |", "|*   *|", "|*   *|", "|*   *|"]
      middle_rows = ["|     |", "|  *  |", "|     |", "|  *  |", "|     |", "|  *  |", "|*   *|"]
      bottom_rows = ["|     |", "|     |", "|    *|", "|    *|", "|*   *|", "|*   *|", "|*   *|"]
      
      puts top_rows[dots]
      puts middle_rows[dots]
      puts bottom_rows[dots]
    end

    puts divider
    create_face(top)
    puts divider
    create_face(bottom)
    puts divider
  end
end

def swap_tops_and_bottoms(list)
  list.map do |dom| 
    Domino.new(dom.bottom, dom.top)
  end
end

double_six_dom_set = Domino.get_double_six_set
new_dom_set = swap_tops_and_bottoms(double_six_dom_set)

puts "-----------------------------"
puts "Regular Double Six Set: "
double_six_dom_set.each { |dom| dom.to_s }

puts "-----------------------------"
puts "Swapped Set: "
new_dom_set.each { |dom| dom.to_s }
