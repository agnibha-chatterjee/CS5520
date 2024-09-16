//MARK: Question 4, Remove the First and Last Characters

/*
 Create a function that removes the first and last characters from a string.
 
 removeFirstLast("hello") ➞ "ell"

 removeFirstLast("maybe") ➞ "ayb"

 removeFirstLast("benefit") ➞ "enefi"

 removeFirstLast("a") ➞ "a"
 
 Borrowed from: edabit.com
 
 HINT: remove(at: index)
 */

//Calling the function
// let removedFirstAndLast = removeFirstLast(...)
// print(removedFirstAndLast)

func removeFirstLast(_ str: String) -> String {
   if str.count == 2 {
        return ""
    }
    
    if str.count < 2 {
        return str
    }

    let startIndex = str.index(after: str.startIndex)
    let endIndex = str.index(before: str.endIndex)
    
    return String(str[startIndex..<endIndex])
}

print(removeFirstLast("hello")) // Should print: "ell"
print(removeFirstLast("maybe")) // Should print: "ayb"
print(removeFirstLast("benefit")) // Should print: "enefi"
print(removeFirstLast("a")) // Should print: "a"    
print(removeFirstLast("")) // Should print: ""
print(removeFirstLast("ab")) // Should print: ""
print(removeFirstLast("!@#")) // Should print: "@"
print(removeFirstLast("12345")) // Should print: "234"
print(removeFirstLast("AbCdE")) // Should print: "bCd"
print(removeFirstLast("😊😊😊")) // Should print: "😊"
print(removeFirstLast("aaa")) // Should print: "a"
print(removeFirstLast("  ")) // Should print: ""
print(removeFirstLast(" ")) // Should print: " "