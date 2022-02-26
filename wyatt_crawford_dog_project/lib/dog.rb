class Dog
    def initialize(name, breed, age, bark, favorite_foods)
        @name = name
        @breed = breed
        @age = age
        @bark = bark
        @favorite_foods = favorite_foods
    end

    def name
        @name
    end

    def breed
        @breed
    end

    def age
        @age
    end

    def age=(num)
        @age = num
    end

    def bark
        @bark
        if @age > 3
            @bark.upcase
        else
            @bark.downcase
        end
    end

    def favorite_foods
        @favorite_foods
    end

    def favorite_food?(food)
        @favorite_foods.map(&:downcase).include?(food.downcase)
    end
end

dog_1 = Dog.new("Snoopy", "Terrier", 10, "Boof", ["Treats", "Meat"])
dog_2 = Dog.new("Roscoe", "Shiba Inu", 2, "Bork", ["Bacon", "Burgers"])


p dog_1.age
p dog_2.favorite_foods