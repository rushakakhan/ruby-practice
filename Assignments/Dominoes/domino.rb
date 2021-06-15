class Domino

  attr_reader :top, :bottom

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
      top_row = ""
      middle_row = ""
      bottom_row = ""

      if dots <= 1
        top_row = "|     |"
        bottom_row = "|     |"
      end

      if dots % 2 == 1
        middle_row = "|  *  |"
      end

      if dots > 1 && dots < 4
        top_row = "|*    |"
        if dots == 2
          middle_row = "|     |"
        end
        bottom_row = "|    *|"
      else
        top_row = "|*   *|"
        bottom_row = "|*   *|"
        if dots == 4
          middle_row = "|     |"
        else
          middle_row = "|*   *|"
        end
      end
      puts top_row
      puts middle_row
      puts bottom_row
    end

    puts divider
    create_face(top)
    puts divider
    create_face(bottom)
    puts divider
  end
end

doms = []
doms << Domino.new(0, 1)
doms << Domino.new(3, 5)
doms << Domino.new(1, 2)
doms << Domino.new(4, 4)
doms << Domino.new(5, 3)
doms << Domino.new(6, 6)

doms.each { |dom| dom.to_s }