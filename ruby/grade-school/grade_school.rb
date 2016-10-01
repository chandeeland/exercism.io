class School
  def initialize
    @school = {}
  end

  def add(name, grade)
    @school[grade] = [] if @school[grade].nil? && grade.to_i > 0
    @school[grade] << name
  end

  attr_reader :school

  def students(grade)
    (school[grade] || []).sort
  end

  def students_by_grade
    school.keys.sort.map{ |k| {grade: k, students: students(k)}}
  end
end

module BookKeeping
  VERSION = 3
end
