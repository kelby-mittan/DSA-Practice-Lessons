//: [Previous](@previous)

import Foundation

// Given a directed graph, design an algorithm to find out whether there is a
// route between two nodes.

// do I know both nodes are in the same graph?
// yes

// function signature?

// input size?
// hundreds/thousands -- small enough for one computer

func findRoute(_ start: Node, _ end: Node) -> Bool {

  var queue: [Node] = [start]
  var i = 0

//   var visitedDict: [String:Bool] = [:]
  var visitedSet = Set<String>()
  
  while i < queue.count {
    let node = queue[i]
    visitedSet.insert(node.id)
    // print("Checking node " + node.id + " with " + String(queue.count) + " in the queue")

    if node.id == end.id {
      return true
    }
    
    for neighbor in node.neighbors {
      // The runtime could be dominated this
      // but in an ideal solution this is O(1)
      if !visitedSet.contains(neighbor.id) {
        queue.append(neighbor)
      }
    }
    i+=1
  }

  return false
}

class Node {

    var id: String
    var neighbors: [Node] = []

    // static func == (lhs: Node, rhs: Node) -> Bool {
    //   return lhs.id == rhs.id
    // }

    init(_ id: String) {
      self.id=id
    }
}

class NodeWithEdges {
  var id: String
  var edges: [Edge] = []

  init(_ id: String) {
    self.id = id
  }
}

class Edge {
    var destination: NodeWithEdges
    var cost: Int

    init(destination: NodeWithEdges, cost: Int) {
        self.destination = destination
        self.cost = cost
    }
}

var a = Node("A")
var b = Node("B")
var c = Node("C")
var d = Node("D")
var e = Node("E")
a.neighbors = [b]
b.neighbors = [c,d]
d.neighbors = [e]
e.neighbors = [b]

// print(findRoute(a,c)) // true
// print(findRoute(c,e)) // false
// print(findRoute(e,a)) // false
// print(findRoute(a,a)) // true

func findRoute(start: NodeWithEdges, end: NodeWithEdges) -> [String]? {
    func findRoute(_ previousVisits: [String], _ node: NodeWithEdges) -> [String]? {
        let preNodes = previousVisits + [node.id]

        for edge in node.edges {
            if edge.destination.id == end.id {
                return preNodes + [edge.destination.id]
            }
            let routes = findRoute(preNodes, edge.destination)
            if routes != nil {
              return routes
            }
        }
        return nil
    }
    return findRoute([], start)
}

var a2 = NodeWithEdges("A")
var b2 = NodeWithEdges("B")
var c2 = NodeWithEdges("C")
var d2 = NodeWithEdges("D")
var e2 = NodeWithEdges("E")
a2.edges = [Edge(destination: b2, cost: 2)]
b2.edges = [Edge(destination: c2, cost: 1), Edge(destination: d2, cost: 10)]
d2.edges = [Edge(destination: e2, cost: 3)]
e2.edges = [Edge(destination: b2, cost: 1)]

// print(findRoute(start: a2, end: e2)) // [A,B,D,E]


func findRouteCost(start: NodeWithEdges, end: NodeWithEdges) -> Int {
  func findRoute(_ edges: [Edge], _ node: NodeWithEdges) -> [Edge]? {
    for edge in node.edges {
      let newEdges = edges + [edge]
      if edge.destination.id == end.id {
          return newEdges
      }
      let routes = findRoute(newEdges, edge.destination)
      if routes != nil {
        return routes
      }
    }
    return nil
  }
  let edges = findRoute([], start)
  guard let edges2 = edges else {
    return 0
  }
  var totalCost = 0
  for edge in edges2 {
      totalCost += edge.cost
  }
  return totalCost
}

print(findRouteCost(start: a2, end: e2)) // 2 + 10 + 3 = 15

// class Graph {

// var canvas: [Node] = []

//   func getNodes() -> [Node] {
//     return canvas;
//   }

//   func addNode(id: String) -> Node {
//       let newNode = Node(id)
//       if canvas.contains(newNode) {

//       }
//       canvas.append(newNode)
//       return newNode
//   }
// }
