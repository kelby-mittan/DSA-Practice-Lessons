//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

public struct Vertex<T: Hashable> {
    var data: T
}

extension Vertex: Hashable {
    public var hashValue: Int { // 1
        return "\(data)".hashValue
    }
    
    static public func ==(lhs: Vertex, rhs: Vertex) -> Bool { // 2
        return lhs.data == rhs.data
    }
}

extension Vertex: CustomStringConvertible {
    public var description: String {
        return "\(data)"
    }
}

public enum EdgeType {
    case directed, undirected
}

public struct Edge<T: Hashable> {
    public var source: Vertex<T> // 1
    public var destination: Vertex<T>
    public let weight: Double? // 2
}

extension Edge: Hashable {
    
    public var hashValue: Int {
        return "\(source)\(destination)\(weight ?? 0)".hashValue
    }
    
    static public func ==(lhs: Edge<T>, rhs: Edge<T>) -> Bool {
        return lhs.source == rhs.source &&
            lhs.destination == rhs.destination &&
            lhs.weight == rhs.weight
    }
}

protocol Graphable {
    associatedtype Element: Hashable // 1
    var description: CustomStringConvertible { get } // 2
    
    func createVertex(data: Element) -> Vertex<Element> // 3
    func add(_ type: EdgeType, from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?) // 4
    func weight(from source: Vertex<Element>, to destination: Vertex<Element>) -> Double? // 5
    func edges(from source: Vertex<Element>) -> [Edge<Element>]? // 6
}

open class AdjacencyList<T: Hashable> {
    public var adjacencyDict : [Vertex<T>: [Edge<T>]] = [:]
    public init() {}
}

extension AdjacencyList: Graphable {
    public typealias Element = T
}

public func createVertex(data: Element) -> Vertex<Element> {
    let vertex = Vertex(data: data)
    
    if adjacencyDict[vertex] == nil {
        adjacencyDict[vertex] = []
    }
    
    return vertex
}

fileprivate func addDirectedEdge(from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?) {
    let edge = Edge(source: source, destination: destination, weight: weight) // 1
    adjacencyDict[source]?.append(edge) // 2
}

fileprivate func addUndirectedEdge(vertices: (Vertex<Element>, Vertex<Element>), weight: Double?) {
    let (source, destination) = vertices
    addDirectedEdge(from: source, to: destination, weight: weight)
    addDirectedEdge(from: destination, to: source, weight: weight)
}

public func add(_ type: EdgeType, from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?) {
    switch type {
    case .directed:
        addDirectedEdge(from: source, to: destination, weight: weight)
    case .undirected:
        addUndirectedEdge(vertices: (source, destination), weight: weight)
    }
}

public func weight(from source: Vertex<Element>, to destination: Vertex<Element>) -> Double? {
    guard let edges = adjacencyDict[source] else { // 1
        return nil
    }
    
    for edge in edges { // 2
        if edge.destination == destination { // 3
            return edge.weight
        }
    }
    
    return nil // 4
}

public func edges(from source: Vertex<Element>) -> [Edge<Element>]? {
    return adjacencyDict[source]
}

public var description: CustomStringConvertible {
    var result = ""
    for (vertex, edges) in adjacencyDict {
        var edgeString = ""
        for (index, edge) in edges.enumerated() {
            if index != edges.count - 1 {
                edgeString.append("\(edge.destination), ")
            } else {
                edgeString.append("\(edge.destination)")
            }
        }
        result.append("\(vertex) ---> [ \(edgeString) ] \n ")
    }
    return result
}


let adjacencyList = AdjacencyList<String>()

let singapore = adjacencyList.createVertex(data: "Singapore")
let tokyo = adjacencyList.createVertex(data: "Tokyo")
let hongKong = adjacencyList.createVertex(data: "Hong Kong")
let detroit = adjacencyList.createVertex(data: "Detroit")
let sanFrancisco = adjacencyList.createVertex(data: "San Francisco")
let washingtonDC = adjacencyList.createVertex(data: "Washington DC")
let austinTexas = adjacencyList.createVertex(data: "Austin Texas")
let seattle = adjacencyList.createVertex(data: "Seattle")

adjacencyList.add(.undirected, from: singapore, to: hongKong, weight: 300)
adjacencyList.add(.undirected, from: singapore, to: tokyo, weight: 500)
adjacencyList.add(.undirected, from: hongKong, to: tokyo, weight: 250)
adjacencyList.add(.undirected, from: tokyo, to: detroit, weight: 450)
adjacencyList.add(.undirected, from: tokyo, to: washingtonDC, weight: 300)
adjacencyList.add(.undirected, from: hongKong, to: sanFrancisco, weight: 600)
adjacencyList.add(.undirected, from: detroit, to: austinTexas, weight: 50)
adjacencyList.add(.undirected, from: austinTexas, to: washingtonDC, weight: 292)
adjacencyList.add(.undirected, from: sanFrancisco, to: washingtonDC, weight: 337)
adjacencyList.add(.undirected, from: washingtonDC, to: seattle, weight: 277)
adjacencyList.add(.undirected, from: sanFrancisco, to: seattle, weight: 218)
adjacencyList.add(.undirected, from: austinTexas, to: sanFrancisco, weight: 297)


adjacencyList.description

// How much is a flight from Singapore to Tokyo?
adjacencyList.weight(from: singapore, to: tokyo)

// What are all the flights from San Francisco?
if let flightsFromSanFrancisco = adjacencyList.edges(from: sanFrancisco) {
    print("San Francisco Out Going Flights:")
    print("--------------------------------")
    for edge in flightsFromSanFrancisco {
        print("from: \(edge.source) to: \(edge.destination)")
    }
}



