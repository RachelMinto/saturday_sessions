
class Garden
  attr_accessor :students, :row_one, :row_two
  @plant_types = [:radishes, :clover, :grass, :violets]
  
  def initialize(diagram, students=nil)
    @diagram = diagram
    @students = students.sort if students
    @students ||= %w(Alice Bob Charlie David Eve Fred Ginny Harriet Ileana Joseph Kincaid Larry)
    @row_one, @row_two = diagram.split()
    p @row_one, @row_two
    create_students_with_plants
  end
  
  def create_students_with_plants
    if @row_one
      instance_variable_set("@#{@students.shift.downcase!}", Student.new("RCGG"))
    end
  end
end

class Student
  def initialize(plants)
    @plants = plants
  end
  
  def to_s
    @plants
  end
end

garden = Garden.new("RC\nGG")
p garden.alice