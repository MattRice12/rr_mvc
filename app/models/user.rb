class User
  attr_accessor :first_name, :last_name, :id, :age
  def initialize(first_name, last_name, id, age)
    @first_name = first_name
    @last_name = last_name
    @id = id
    @age = age
  end
end

class All
  users = [
    User.new("Bilbo", "Baggins", "1", "111"),
    User.new("Frodo", "Baggins", 2, 80),
    User.new("Samwise", "Gamgee", 1, 75),
    User.new("Peregrin", "Took", 1, 60),
    User.new("Meridock", "Brandibuck", 1, 68),
    User.new("Aragorn", "Ellesar", 1, 84),
    User.new("Legolas", "Greenleaf", 1, 1041),
    User.new("Gimli", "SonOfGloin", 1, 369),
    User.new("Boromir", "SonOfDenethor", 1, 35),
    User.new("Gandalf", "Mithrandir", 1, 4214),
  ]

  begin
    users.each do |user|
      puts "#{user.first_name} #{user.last_name}, age: #{user.age}"
    end

  end
end
