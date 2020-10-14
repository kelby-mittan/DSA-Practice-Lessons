import Foundation

/*
 Graphs
 
 A graph is a data structure used to represent relationships between real world objects. It is composed of two main components.
    - The first is one or many vertices.
        - Vertices are used to represent real world objects.
    - The second is an edge that connects two vertices.
        - Edges show the relationship between these objects.
 
 - Direction. The edges on a graph can be directed, or undirected.
    - If an edge is directed, this means that you can only traverse that edge in one direction.
    - Similarly, if an edge is undirected, you can traverse this edge in two directions.
 
 - Weight. Weight represents the cost of traversing an edge.
    - One example of this might be a graph that is used to show a number of different flights in airports around the world. We could say that a flight from New York to Los Angeles costs $300. This cost would be the weight of the edge from New York to Los Angeles.
 
 - There are two ways to represent a graph.
    - Adjacency List
        - The idea behind an adjacency list is that we have a dictionary that we'll use to keep track of each vertex in our graph, and the edges associated with it.
    - Adjacency Matrix
        - The idea behind an adjacency matrix is that we have a number of vertices, and we have a matrix that represents the weight associated with each edge connecting two vertices.
 
  - Supplemental Notes:

   - Weighted Graphs:
        - In a weighted graph, every edge has a weight associated with it that represents the cost of using this edge.
        - Such a graph allows you to choose the cheapest or shortest path between two vertices.
        - One example might be finding the cheapest flight to a given location from another location. Where the cost of a flight from one location to another is the weight of the edge between those two locations.
 
    - Directed Graphs:
        - In addition to a weight, an edge can have a direction.
        - Directed Graphs are more restrictive to traverse, as an edge may only permit travel in one direction.
 
    - Undirected Graphs:
        - An undirected graph can be thought of as a directed graph where all edges are bidirectional (i.e. can be traversed in both directions).
        - In these graphs, the weight of the edges applies in both directions.
 
    - Vertex:
        - A vertex contains a unique index within its graph and a piece of data.
        - A vertex will be used as the key type for a dictionary, so it must conform to hashable.
 
    - Edge:
        - In order to connect two vertices, there must be an edge between them.
        - Very simply, an edge connects two vertices, and may or may not have a weight associated with it.
 
    - Implementation: Adjacency List
        - An adjacency list stores a list of outgoing edges for every vertex in the graph.
        - Code wise, this will be implemented using a dictionary in which a vertex is used as a key (hence the need to make it hashable) and an array of edges will be used as a value.
 
    - Implementation: Adjacency Matrix
        - An adjacency matrix is a square matrix used to represent a graph.
        - The matrix is a two dimensional array where the value of matrix[row][col] represents the weight of the edge between the vertices at row and col.
            - It is important to note that the order of accessing the vertices matters. So for example, if Johannesburg to London costs $400, but there is no direct path from London to Johannesburg, then matrix[Johannesburg][London] would have a  value of $400, and matrix[London][Johannesburg] would have a value of nil.
        - Of equal importance is the fact that edges without a weight have a value of nil at matrix[row][col].
        - It is important to note that there cannot be an edge between a vertex and itself. These values are nil.
        - Our implementation of this graph will be an array to hold our vertices plus a matrix to hold our weights.
            - This matrix will be of type optional double. This is because we cannot have an edge between a vertex and itself, so we need to use nil to represent that.
 
    - This is simply an observation, but it would seem that this method produces a matrix that is always VxV. Where V represents the number of vertices in the graph.
 
    - Adjacency List vs. Adjacency Matrix
        - An adjacency list is good to use for a sparse graph, which is a graph that has a few edges. This is because the space in a matrix would be wasted.
        - If the graph is dense, meaning it has a lot of edges, it would be a better idea to use an Adjacency Matrix.
*/

public enum EdgeType {
    case directed
    case undirected
}

// Describes the common operations for a graph.
public protocol Graph {
    associatedtype T
    
    /// Creates a vertex and adds it to the graph.
    func createVertex(data: T) -> Vertex<T>
    /// Adds a directed edge between two vertices.
    func addDirectedEdge(from source: Vertex<T>, to destination: Vertex<T>, weight: Double?)
    /// Adds an undirected / bidirectional edge between two vertices.
    func addUndirectedEdge(between source: Vertex<T>, and destination: Vertex<T>, weight: Double?)
    /// Uses `EdgeType` to add either a directed or undirected edge between two vertices.
    func add(_ edge: EdgeType, from source: Vertex<T>, to destination: Vertex<T>, weight: Double?)
    /// Returns a list of outgoing edges from a specfic vertex.
    func edges(from source: Vertex<T>) -> [Edge<T>]
    /// Returns the weight of the edge between two vertices.
    func weight(from source: Vertex<T>, to destination: Vertex<T>) -> Double?
}

extension Graph {
    
    // This essentially adds two directed edges to the graph.
    // In other words, adding a undirected edge is the same as adding two directed edges.
    /// Adds  a directed edge to the graph.
    public func addUndirectedEdge(between source: Vertex<T>, and destination: Vertex<T>, weight: Double?) {
        addDirectedEdge(from: source, to: destination, weight: weight)
        addDirectedEdge(from: destination, to: source, weight: weight)
    }
    
    /// A helper method that either adds a directed, or undirected edge to the graph.
    public func add(_ edge: EdgeType, from source: Vertex<T>, to destination: Vertex<T>, weight: Double?) {
        switch edge {
        case EdgeType.directed:
            addDirectedEdge(from: source, to: destination, weight: weight)
        case EdgeType.undirected:
            addUndirectedEdge(between: source, and: destination, weight: weight)
        }
    }
    
}

public struct Vertex<T> {
    public let index: Int
    public let data: T
}

extension Vertex: Hashable where T: Hashable {}
extension Vertex: Equatable where T: Equatable {}
extension Vertex: CustomStringConvertible {
    public var description: String {
        "\(index) \(data)"
    }
}

public struct Edge<T> {
    public let source: Vertex<T>
    public let destination: Vertex<T>
    public let weight: Double?
}

public class AdjacencyList<T:Hashable>: Graph {
    
    private var adjacencies: [Vertex<T>:[Edge<T>]] = [:]
    
    public init() {}
    
    public func createVertex(data: T) -> Vertex<T> {
        // Create a new vertex.
        // Notice the use of adjacencies.count to get a unique index.
        let newVertex = Vertex<T>(index: adjacencies.count, data: data)
        // Add the new vertex to our adjacency list, with the number of edges equal to none.
        adjacencies[newVertex] = []
        // Return the newly created vertex.
        return newVertex
    }
    
    /// Creates a new edge and stores it in the adjacency list.
    public func addDirectedEdge(from source: Vertex<T>, to destination: Vertex<T>, weight: Double?) {
        // Take in the source vertex, the destination vertex, and the weight if it exists.
        // Use this information to create a new edge.
        let newEdge = Edge(source: source, destination: destination, weight: weight)
        // Add the edge to the source vertex.
        // Optional chaining is a result of accessing an element in a dictionary, not because the vertex itself doesn't exist.
        adjacencies[source]?.append(newEdge)
    }
    
    /// Returns the edges connected to a vertex.
    public func edges(from source: Vertex<T>) -> [Edge<T>] {
        return adjacencies[source] ?? []
    }
    
    /// Returns the weight of an edge between a given source and destination.
    public func weight(from source: Vertex<T>, to destination: Vertex<T>) -> Double? {
        return edges(from: source).filter{ $0.destination == destination }.first?.weight
    }
    
}

extension AdjacencyList: CustomStringConvertible {
    
    public var description: String {
        var result = ""
        for (vertex, edges) in adjacencies {
            var edgeString = ""
            for (index, edge) in edges.enumerated() {
                if index != edges.count - 1 {
                    edgeString.append("\(edge.destination): \(edge.weight ?? 0), ")
                } else {
                    edgeString.append("\(edge.destination): \(edge.weight ?? 0),")
                }
            }
            result.append("\(vertex) ---> [\(edgeString)] \n")
        }
        return result
    }
}

public class AdjacencyMatrix<T>: Graph {
    
    private var vertices: [Vertex<T>] = []
    private var weights: [[Double?]] = []
    
    public init() {}
    
    /// Creates a vertex to be used in a graph.
    public func createVertex(data: T) -> Vertex<T> {
        // Create a new vertex
        let vertex = Vertex<T>(index: vertices.count, data: data)
        
        // Append the vertex to our array of vertices
        vertices.append(vertex)
        
        // Append nil weight to every row in the matrix.
        // No edges have been added to the new vertex yet.
        // Basically for the newest column, we are setting every value to nil.
        // So if we add a new vertex, the weights to this vertex are defaulted to nil, because they do not yet exist.
        for i in 0..<weights.count {
            weights[i].append(nil)
        }
        
        // Create a new row.
        // This row will hold the outgoing edges for the matrix.
        let row = [Double?](repeating: nil, count: vertices.count)
        
        // Append the row to the matrix.
        weights.append(row)
        
        return vertex
    }
    
    /// Add a directed Edge to the graph from one vertex to another with some weight.
    public func addDirectedEdge(from source: Vertex<T>, to destination: Vertex<T>, weight: Double?) {
        // Remember that each vertex has an index that is set to the number of items in the vertex array.
        weights[source.index][destination.index] = weight
    }
    
    /// Returns all edges stemming from a source vertex.
    public func edges(from source: Vertex<T>) -> [Edge<T>] {
        // Create an array to store the edges of the current vertex.
        // This is necessary because none exists like in our AdjacencyList.
        var edges: [Edge<T>] = []
        
        // We loop through the weight matrix and append an edge to the new array if there is a weight associated with that destination.
        for column in 0..<weights.count {
            if let weight = weights[source.index][column]{
                edges.append(Edge(source: source, destination: vertices[column], weight: weight))
            }
        }
        
        // Return the newly created array.
        return edges
    }
    
    /// Returns the weight of an edge from the source vertex to the destination vertex.
    public func weight(from source: Vertex<T>, to destination: Vertex<T>) -> Double? {
        return weights[source.index][destination.index]
    }
}

extension AdjacencyMatrix: CustomStringConvertible {
    
    public var description: String {
        let verticesDescription = vertices.map{ "\($0)" }.joined(separator: "\n")
        
        var grid: [String] = []
        
        for i in 0..<weights.count {
            var row = ""
            for j in 0..<weights.count {
                if let value = weights[i][j] {
                    row += "\(value)\t"
                } else {
                    row += "0\t\t"
                }
            }
            grid.append(row)
        }
        let edgesDescription = grid.joined(separator: "\n")
        return "\(verticesDescription)\n\n\(edgesDescription)"
    }
    
}


let graph = AdjacencyList<String>()

var ameniVertex = graph.createVertex(data: "Ameni")
var kelbyVertex = graph.createVertex(data: "Kelby")
var brendonVertex = graph.createVertex(data: "Brendon")
var youDudeVertex = graph.createVertex(data: "YouDude")
var cameronVertex = graph.createVertex(data: "Cameron")
var alexVertex = graph.createVertex(data: "Alex Paul")
var daphneVertex = graph.createVertex(data: "Daphne")
var juanVertex = graph.createVertex(data: "Juan")
var davidVertex = graph.createVertex(data: "David *")
var jukayVertex = graph.createVertex(data: "Jukay")

graph.add(.undirected, from: youDudeVertex, to: jukayVertex, weight: 82)
graph.add(.undirected, from: alexVertex, to: juanVertex, weight: 12)
graph.add(.undirected, from: daphneVertex, to: jukayVertex, weight: 92)
graph.add(.undirected, from: davidVertex, to: brendonVertex, weight: 100)
graph.add(.undirected, from: cameronVertex, to: youDudeVertex, weight: 93)
graph.add(.undirected, from: ameniVertex, to: alexVertex, weight: 59)
graph.add(.undirected, from: kelbyVertex, to: daphneVertex, weight: 75)
graph.add(.undirected, from: brendonVertex, to: jukayVertex, weight: 60)
graph.add(.undirected, from: juanVertex, to: davidVertex, weight: nil)
graph.add(.undirected, from: kelbyVertex, to: brendonVertex, weight: 95)
graph.add(.undirected, from: cameronVertex, to: alexVertex, weight: 100)
graph.add(.undirected, from: ameniVertex, to: daphneVertex, weight: 100)
graph.add(.undirected, from: kelbyVertex, to: cameronVertex, weight: 95)
graph.add(.undirected, from: youDudeVertex, to: davidVertex, weight: 55)

print(graph)
