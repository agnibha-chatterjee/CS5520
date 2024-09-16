//MARK: Question 2, Sort and Array by String length

/* Create a function that takes an array of strings and return an array, sorted from shortest to longest.
 
 sortByLength(["Google", "Apple", "Microsoft"])
 ➞ ["Apple", "Google", "Microsoft"]

 sortByLength(["Leonardo", "Michelangelo", "Raphael", "Donatello"])
 ➞ ["Raphael", "Leonardo", "Donatello", "Michelangelo"]

 sortByLength(["Turing", "Einstein", "Jung"])
 ➞ ["Jung", "Turing", "Einstein"]
 
 Borrowed from: edabit.com
 */


//Calling the function
// let sortedArray = sortByLength(...)
// print(sortedArray)


func sortByLength(_ strs: [String]) -> [String] {
    return strs.sorted(by: { (str1: String, str2: String)-> Bool in
        return str1.count < str2.count
    })
}


print(sortByLength(["Google", "Apple", "Microsoft"])) // Should print: ["Apple", "Google", "Microsoft"]
print(sortByLength(["Leonardo", "Michelangelo", "Raphael", "Donatello"])) // Should print: ["Raphael", "Leonardo", "Donatello", "Michelangelo"]
print(sortByLength(["Turing", "Einstein", "Jung"])) // Should print: ["Jung", "Turing", "Einstein"]
print(sortByLength(["a", "bb", "ccc", "dddd"])) // Should print: ["a", "bb", "ccc", "dddd"]
print(sortByLength(["", "a", "bb", "ccc"])) // Should print: ["", "a", "bb", "ccc"]
print(sortByLength(["", "", "", ""])) // Should print: ["", "", "", ""]
print(sortByLength(["same", "length", "words"])) // Should print: ["same", "length", "words"]
print(sortByLength([])) // Should print: []
print(sortByLength(["single"])) // Should print: ["single"]