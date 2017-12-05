class Person

  def initialize(name)
    @raw_name = name
  end

  def deconstructor
    @formatted = @raw_name.split(",")
    @formatted[1].strip!
    @formatted.join(" ")
    @formatted
  end

  def first_name
    @first_name = @formatted[1]
  end

  def last_name
    @first_name = @formatted[0]
  end

end

people = []

File.open('names.csv').each do |name|
  person = Person.new(name)
  person.deconstructor
  people << person
end

people = people.sort_by { |person| [ person.last_name, person.first_name ] }

people.each do |person|
  p "#{person.first_name} #{person.last_name}"
end
