//: [Previous](@previous)

import Foundation

func allPathsSourceTarget(_ graph: [[Int]]) -> [[Int]] {
    var result = [[Int]]()
    var stack = [[Int]]()
    
    //start path
    stack.append([0])
    
    while stack.count > 0 {
        
        //Pick last path and last element of that path
        let lastPath = stack.removeLast()
        let lastPathElement = lastPath.last!
        
        for next in graph[lastPathElement] {
            //generate new path
            var newPath = lastPath
            newPath.append(next)
            
            //if reach destination just add to result
            if next == graph.count - 1 {
                result.append(newPath)
                continue
            }
            
            stack.append(newPath)
        }

    }
    return result
}
