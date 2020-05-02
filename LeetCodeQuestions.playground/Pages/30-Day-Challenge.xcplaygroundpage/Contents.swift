//: [Previous](@previous)

import Foundation

/*
 844. Backspace String Compare
 Easy
 
 Given two strings S and T, return if they are equal when both are typed into empty text editors. # means a backspace character.
 
 Note that after backspacing an empty text, the text will continue empty.
 
 Example 1:
 
 Input: S = "ab#c", T = "ad#c"
 Output: true
 Explanation: Both S and T become "ac".
 Example 2:
 
 Input: S = "ab##", T = "c#d#"
 Output: true
 Explanation: Both S and T become "".
 Example 3:
 
 Input: S = "a##c", T = "#a#c"
 Output: true
 Explanation: Both S and T become "c".
 Example 4:
 
 Input: S = "a#c", T = "b"
 Output: false
 Explanation: S becomes "c" while T becomes "b".
 */


func backspaceCompare(_ S: String, _ T: String) -> Bool {
    
    var s = [Character]()
    var t = [Character]()
    
    for letter in S {
        if letter == "#" && s.count > 0 {
            s.removeLast()
        } else if letter != "#"{
            s.append(letter)
        }
    }
    
    for letter in T {
        if letter == "#" && t.count > 0 {
            t.removeLast()
        } else if letter != "#"{
            t.append(letter)
        }
    }
    
    return s == t
}

backspaceCompare("a#c", "b#c")
