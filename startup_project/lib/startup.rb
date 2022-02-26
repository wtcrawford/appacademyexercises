require "employee"

class Startup
    attr_reader :name, :funding, :salaries, :employees
    
    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries            #is a hash
        @employees = []
    end

    def valid_title?(title)  #title is the key in the salaries hash. salary is value
        @salaries.has_key?(title)
    end

    def >(another_startup)
        return true if self.funding > another_startup.funding
        return false if self.funding < another_startup.funding
    end

    def hire(employee_name, title)
        if self.valid_title?(title)
            @employees << Employee.new(employee_name, title)
        else
            raise "title is invalid"
        end
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        wage = @salaries[employee.title]
        if @funding >= wage
            employee.pay(wage)
            @funding -= wage
        else
            raise "not enough funds"
        end
    end
    
    def payday
        @employees.each do |employee|
            self.pay_employee(employee)
        end
    end

    def average_salary
        sum = 0

        @employees.each do |employee|
            sum += @salaries[employee.title]
        end

        sum / (@employees.length * 1.0)
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(another_startup)
        @funding += another_startup.funding
        @employees += another_startup.employees
        
        another_startup.salaries.each do |title, amt|
            if !@salaries.has_key?(title)
                @salaries[title] = amt
            end
        end
        another_startup.close
    end
end
