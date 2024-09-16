
//MARK: Question 5, Four Passengers and a Driver

/*
 A typical car can hold four passengers and one driver, allowing five people to travel around. Given n number of people, return how many cars are needed to seat everyone comfortably.

 carsNeeded(5) ➞ 1

 carsNeeded(11) ➞ 3

 carsNeeded(0) ➞ 0
 
 Borrowed from: edabit.com
 */

//Calling the function
// let numberOfCars = carsNeeded(...)
// print(numberOfCars)


func carsNeeded(_ people: Int) -> Int {
    if people <= 0 {
        return 0
    }
    
    // Reason for + 4 and then / 5:
    // 4 passengers + 1 driver = 5 people per car
    // We want to round up the result because we need a whole number of cars
    // and any additional people still need a car.
    return (people + 4) / 5
}

print(carsNeeded(0)) // Should print: 0
print(carsNeeded(1)) // Should print: 1
print(carsNeeded(4)) // Should print: 1
print(carsNeeded(5)) // Should print: 1
print(carsNeeded(6)) // Should print: 2
print(carsNeeded(10)) // Should print: 2
print(carsNeeded(11)) // Should print: 3
print(carsNeeded(100)) // Should print: 20
print(carsNeeded(-5)) // Should print: 0

