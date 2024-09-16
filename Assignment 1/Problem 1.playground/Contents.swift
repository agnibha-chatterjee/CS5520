// import UIKit

//MARK: Question 1, Concatenating Two Integers

/* Create a function to concatenate two integer arrays.
 concatenate([1, 3, 5], [2, 6, 8]) ➞ [1, 3, 5, 2, 6, 8]

 concatenate([7, 8], [10, 9, 1, 1, 2]) ➞ [7, 8, 10, 9, 1, 1, 2]

 concatenate([4, 5, 1], [3, 3, 3, 3, 3]) ➞ [4, 5, 1, 3, 3, 3, 3, 3]
 
 Do not forget to return the resulting array.
 
 Borrowed from: edabit.com
 */

//Calling the function
// let concatenatedArray = concatenate(array1:[...], array2:[...])
// print(concatenatedArray)


func concatenate(_ arr1: [Int],_ arr2: [Int]) -> [Int] {
    return arr1 + arr2
}

print(concatenate([1, 3, 5], [2, 6, 8])) // Should print: [1, 3, 5, 2, 6, 8]
print(concatenate([4, 5, 1], [3, 3, 3, 3, 3])) // Should print: [4, 5, 1, 3, 3, 3, 3, 3]
print(concatenate([1, 2 ,3], [])) // Should print: [1, 2, 3]
print(concatenate([], [1, 2, 3])) // Should print: [1, 2, 3]
print(concatenate([], [])) // Should print: []
print(concatenate([1], [2])) // Should print: [1, 2]
print(concatenate([1, 2, 3], [4, 5, 6, 7, 8, 9])) // Should print: [1, 2, 3, 4, 5, 6, 7, 8, 9]
print(concatenate([1, 2, 3], [4, 5, 6])) // Should print: [1, 2, 3, 4, 5, 6]
print(concatenate([1, 2, 3, 4, 5], [6, 7, 8, 9, 10])) // Should print: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]


