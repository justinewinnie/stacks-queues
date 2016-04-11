require './Stack.rb'
require './Queue.rb'

# A company has six hiring positions with more people wanting jobs than the number of available positions.  The company managers decide in order to give more people an opportunity to make money; they will allow people to work in three-month intervals. The first five people on the waiting list will be hired in the order that they are on the waiting list.  The first six people will keep these positions for three months.  At the end of three months, the manager will roll a dice to determine the number of people who will lose their jobs. The company will use the policy of last-hired-first-fired.  For example, if the dice roll is 3, the last 3 people hired will lose their jobs to the first 3 people on the waiting list. People losing their jobs will be placed on the back of the waiting list in the order that they are fired. This process will continue for every three-month interval.

module Employment
  class Employees
    def self.get_employees(n)
      employees = Stack.new
      empl_id = 1
      n.times do |employee|
        employees.push("empl" + "#{empl_id}")
        empl_id += 1
      end
      employees
    end
  end

  class Sad_Job_Cycle
    def initialize(employees, job_count)
      @hired = Stack.new
      @waitlist = Queue.new
      print "\nemployees: #{employees}\n"
      employees.size.times do
        employee = employees.pop
        print "\nemployee:  #{employee}"
        @waitlist.enqueue(employee)
      end
      hire(job_count)
    end

    def fire(number)
      number.times do
        fired_person = @hired.pop
        @waitlist.enqueue(fired_person)
      end
    end

    def hire(number)
      number.times do
        hired_person = @waitlist.dequeue
        @hired.push(hired_person)
      end
    end

    def roll_die
      (1..@hired.size).to_a.sample
    end

    def rotate
      number = roll_die
      fire(number)
      hire(number)
      print number
    end
  end
end
