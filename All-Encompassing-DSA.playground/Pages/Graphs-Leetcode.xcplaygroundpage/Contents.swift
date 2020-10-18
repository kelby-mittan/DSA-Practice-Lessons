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

/*
 1334. Find the City With the Smallest Number of Neighbors at a Threshold Distance
 Medium

 There are n cities numbered from 0 to n-1. Given the array edges where edges[i] = [fromi, toi, weighti] represents a bidirectional and weighted edge between cities fromi and toi, and given the integer distanceThreshold.

 Return the city with the smallest number of cities that are reachable through some path and whose distance is at most distanceThreshold, If there are multiple such cities, return the city with the greatest number.

 Notice that the distance of a path connecting cities i and j is equal to the sum of the edges' weights along that path.

 
 Input: n = 4, edges = [[0,1,3],[1,2,1],[1,3,4],[2,3,1]], distanceThreshold = 4
 Output: 3
 Explanation: The figure above describes the graph.
 The neighboring cities at a distanceThreshold = 4 for each city are:
 City 0 -> [City 1, City 2]
 City 1 -> [City 0, City 2, City 3]
 City 2 -> [City 0, City 1, City 3]
 City 3 -> [City 1, City 2]
 Cities 0 and 3 have 2 neighboring cities at a distanceThreshold = 4, but we have to return city 3 since it has the greatest number.
 
 */
