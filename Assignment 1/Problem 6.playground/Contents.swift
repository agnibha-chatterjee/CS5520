//MARK: Question 6, Divide and conquer
/*
 First, create a function that returns the number of times an integer can be divided by another integer without a remainder. The function should return nil if the division doesn’t produce a whole number. Name the function divideIfWhole.

 Then, write code that tries to unwrap the optional result of the function. There should be two cases: upon success, print "Yep, it divides \(answer) times", and upon failure, print "Not divisible :[".

 Finally, test your function:
 
 Call divideIfWhole(10, by: 2) -> 5. Since, the returned value is not nil, print: "Yep, it divides 5 times."
 divideIfWhole(10, by: 3) -> nil. Since, the returned value is nil, print: "Not divisible :[."
 
 
 
 borrowed from: https://www.kodeco.com/
 */


func divideIfWhole(_ dividend: Int, by divisor: Int) -> Int? {
    if divisor == 0 {
        return nil
    }
    let result = dividend / divisor
    if dividend % divisor == 0 {
        return result
    } else {
        return nil
    }
}

func testDivideIfWhole(dividend: Int, by divisor: Int) {
    if let answer = divideIfWhole(dividend, by: divisor) {
        print("Yep, it divides \(answer) times")
    } else {
        print("Not divisible :[")
    }
}

testDivideIfWhole(dividend: 10, by: 2)  // Should print: "Yep, it divides 5 times"
testDivideIfWhole(dividend: 10, by: 3)  // Should print: "Not divisible :["
testDivideIfWhole(dividend: 10, by: 0)  // Should print: "Not divisible :["
testDivideIfWhole(dividend: 10, by: 10) // Should print: "Yep, it divides 1 times"
testDivideIfWhole(dividend: -10, by: 2)  // Should print: "Yep, it divides -5 times"
testDivideIfWhole(dividend: 10, by: -2)  // Should print: "Yep, it divides -5 times"
testDivideIfWhole(dividend: 0, by: 2)    // Should print: "Yep, it divides 0 times"
testDivideIfWhole(dividend: 0, by: 0)    // Should print: "Not divisible :["
testDivideIfWhole(dividend: 1000000, by: 1000)  // Should print: "Yep, it divides 1000 times"
