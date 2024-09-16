//MARK: Question 3, Find the Largest Numbers in a Group of Arrays

/*
 Create a function that takes an array of arrays with numbers. Return a new (single) array with the largest numbers of each.

 findLargest([[4, 2, 7, 1], [20, 70, 40, 90], [1, 2, 0]]) ➞ [7, 90, 2]

 findLargest([[-34, -54, -74], [-32, -2, -65], [-54, 7, -43]]) ➞ [-34, -2, 7]

 findLargest([[0.4321, 0.7634, 0.652], [1.324, 9.32, 2.5423, 6.4314], [9, 3, 6, 3], [1, 2, 3, 4]]) ➞ [0.7634, 9.32, 9, 4]
 
 It is OK, if your returning array is [Double]
 
 Borrowed from: edabit.com
 */

//Calling the function
// let arrayOfLargests = findLargest(...)
// print(arrayOfLargests)

func findLargest(_ nums: [[Double]]) -> [Double] {
    var result: [Double] = []

    for row in nums {
        if row.isEmpty {
            result.append(0)
        } else {
            result.append(row.max() ?? 0)
        }
    }
    
    return result
}

// Assumption: If the array is empty, return 0.0

print(findLargest([[4, 2, 7, 1], [20, 70, 40, 90], [1, 2, 0]])) // Should print: [7.0, 90.0, 2.0]
print(findLargest([[-34, -54, -74], [-32, -2, -65], [-54, 7, -43]])) // Should print: [-34.0, -2.0, 7.0]
print(findLargest([[0.4321, 0.7634, 0.652], [1.324, 9.32, 2.5423, 6.4314], [9, 3, 6, 3], [1, 2, 3, 4]])) // Should print: [0.7634, 9.32, 9.0, 4.0]
print(findLargest([[], [1, 2, 3], [], [4, 5, 6]])) // Should print: [0.0, 3.0, 0.0, 6.0]
print(findLargest([[1], [2], [3], [4]])) // Should print: [1.0, 2.0, 3.0, 4.0]
print(findLargest([[0, -1, -2], [1, 2, 3], [-1, -2, -3], [0]])) // Should print: [0.0, 3.0, -1.0, 0.0]
