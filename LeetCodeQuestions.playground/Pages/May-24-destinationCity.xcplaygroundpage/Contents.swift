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
 151. Reverse Words in a String
 Medium

 Example 1:

 Input: "the sky is blue"
 Output: "blue is sky the"
 Example 2:

 Input: "  hello world!  "
 Output: "world! hello"
 Explanation: Your reversed string should not contain leading or trailing spaces.
 Example 3:

 Input: "a good   example"
 Output: "example good a"
 Explanation: You need to reduce multiple spaces between two words to a single space in the reversed string.
 */

func reverseWords(_ s: String) -> String {
    let sArr = s.components(separatedBy: " ")
    var resultArr = [String]()
    for i in 0..<sArr.count {
        let word = sArr[i]
        
        if word != "" {
            resultArr.insert(word + " ", at: 0)
        }
    }
    var result = resultArr.joined()
    result.removeLast()
    return result
}

reverseWords("  hello world!  ")

/*
 1021. Remove Outermost Parentheses
 Easy

 A valid parentheses string is either empty (""), "(" + A + ")", or A + B, where A and B are valid parentheses strings, and + represents string concatenation.  For example, "", "()", "(())()", and "(()(()))" are all valid parentheses strings.

 A valid parentheses string S is primitive if it is nonempty, and there does not exist a way to split it into S = A+B, with A and B nonempty valid parentheses strings.

 Given a valid parentheses string S, consider its primitive decomposition: S = P_1 + P_2 + ... + P_k, where P_i are primitive valid parentheses strings.

 Return S after removing the outermost parentheses of every primitive string in the primitive decomposition of S.

  

 Example 1:

 Input: "(()())(())"
 Output: "()()()"
 Explanation:
 The input string is "(()())(())", with primitive decomposition "(()())" + "(())".
 After removing outer parentheses of each part, this is "()()" + "()" = "()()()".
 Example 2:

 Input: "(()())(())(()(()))"
 Output: "()()()()(())"
 Explanation:
 The input string is "(()())(())(()(()))", with primitive decomposition "(()())" + "(())" + "(()(()))".
 After removing outer parentheses of each part, this is "()()" + "()" + "()(())" = "()()()()(())".
 Example 3:

 Input: "()()"
 Output: ""
 Explanation:
 The input string is "()()", with primitive decomposition "()" + "()".
 After removing outer parentheses of each part, this is "" + "" = "".
 */

func removeOuterParentheses(_ S: String) -> String {
    var result = ""
    var counter = 0
    for s in S {
        if s == "(" {
           if counter > 0 {
              result.append(s)
           }
           counter += 1
        } else if s == ")" {
           counter -= 1
           if counter > 0 {
               result.append(s)
           }
        }
    }
    return result
}

removeOuterParentheses("(()())(())(()(()))")

/*
 657. Robot Return to Origin
 Easy

 There is a robot starting at position (0, 0), the origin, on a 2D plane. Given a sequence of its moves, judge if this robot ends up at (0, 0) after it completes its moves.

 The move sequence is represented by a string, and the character moves[i] represents its ith move. Valid moves are R (right), L (left), U (up), and D (down). If the robot returns to the origin after it finishes all of its moves, return true. Otherwise, return false.

 Note: The way that the robot is "facing" is irrelevant. "R" will always make the robot move to the right once, "L" will always make it move left, etc. Also, assume that the magnitude of the robot's movement is the same for each move.

 Example 1:

 Input: "UD"
 Output: true
 Explanation: The robot moves up once, and then down once. All moves have the same magnitude, so it ended up at the origin where it started. Therefore, we return true.
  

 Example 2:

 Input: "LL"
 Output: false
 Explanation: The robot moves left twice. It ends up two "moves" to the left of the origin. We return false because it is not at the origin at the end of its moves.
 */

func judgeCircle(_ moves: String) -> Bool {
    
    var dict = [Character:Int]()
    
    for move in moves {
        if dict[move] == nil {
            dict[move] = 1
        } else {
            dict[move]! += 1
        }
    }
    return dict["L"] == dict["R"] && dict["U"] == dict["D"]
}

judgeCircle("UDU")
