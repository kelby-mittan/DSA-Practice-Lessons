//: [Previous](@previous)

import Foundation

/*
 1436. Destination City
 
 You are given the array paths, where paths[i] = [cityAi, cityBi] means there exists a direct path going from cityAi to cityBi. Return the destination city, that is, the city without any path outgoing to another city.

 It is guaranteed that the graph of paths forms a line without any loop, therefore, there will be exactly one destination city.

  

 Example 1:

 Input: paths = [["London","New York"],["New York","Lima"],["Lima","Sao Paulo"]]
 Output: "Sao Paulo"
 Explanation: Starting at "London" city you will reach "Sao Paulo" city which is the destination city. Your trip consist of: "London" -> "New York" -> "Lima" -> "Sao Paulo".
 Example 2:

 Input: paths = [["B","C"],["D","B"],["C","A"]]
 Output: "A"
 Explanation: All possible trips are:
 "D" -> "B" -> "C" -> "A".
 "B" -> "C" -> "A".
 "C" -> "A".
 "A".
 Clearly the destination city is "A".
 Example 3:

 Input: paths = [["A","Z"]]
 Output: "Z"
  
 */


func destCity(_ paths: [[String]]) -> String {
    
    var pathDict = [String:String]()
    
    for path in paths {
        pathDict[path[0]] = path[1]
    }
    
    print(pathDict)
    for dest in pathDict.values {
        if pathDict[dest] == nil {
            return dest
        }
    }
    
    return "IDK"
    
}

destCity([["London","New York"],["New York","Lima"],["Lima","Sao Paulo"]])


/*
 709. To Lower Case
 Easy

 Example 1:

 Input: "Hello"
 Output: "hello"
 Example 2:

 Input: "here"
 Output: "here"
 Example 3:

 Input: "LOVELY"
 Output: "lovely"
 */

func toLowerCase(_ str: String) -> String {
    var s = ""
    for char in str {
        let lowerChar = String(char)
        if char.isUppercase {
            s += lowerChar.lowercased()
        } else {
            s += lowerChar
        }
    }
    return s
}

/*
 
 */
