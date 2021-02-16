//: [Previous](@previous)

import Foundation

class TrieNode {
    var char: Character // the character of the node
    var isCompleteWord: Bool // bool to indicate if the path is a complete word
    var children: [Character: TrieNode] // the children of the parent node
    var parent: TrieNode? // parent useful in thhe case of deleting nodes
    
    init(_ char: Character, parent: TrieNode? = nil) {
        self.char = char
        self.parent = parent
        self.isCompleteWord = false
        self.children = [:]
    }
    
    // add a new child to the node's children
    public func add(_ child: Character) {
        // check to see if the node already exist
        guard children[child] == nil else { return }
        
        // if not, create a new child
        children[child] = TrieNode(child, parent: self)
    }
}

class Trie {
    private var root: TrieNode
    
    init() {
        self.root = TrieNode("*")
    }
    
    private func getNode(_ word: String) -> TrieNode? {
        var currentNode = root
        for char in word {
            guard let childNode = currentNode.children[char] else { return nil } // return nil if any node does not exist for a character
            
            // traverse the path where the "word" exist
            currentNode = childNode
        }
        return currentNode // we've found the node for the "word"
    }
    
    // inserts a word into the Trie
    func insert(_ word: String) {
        var currentNode = root
        
        // traverse the "word" and perform insertion accordingly
        for char in word {
            // look up children nodes to find out if node already exist
            if let childNode = currentNode.children[char] {
                // if it exist simply move down the path
                currentNode = childNode
            } else {
                // if the node does not exist, create and add a new child
                currentNode.add(char)
                
                // then move down the Trie
                guard let childNode = currentNode.children[char] else { return }
                currentNode = childNode
            }
        }
        
        // check if word is already marked complete
        guard !currentNode.isCompleteWord else { return }
        
        // mark work complete
        currentNode.isCompleteWord = true
    }
    
    // returns true if the word is in the Trie
    func search(_ word: String) -> Bool {
        guard let node = getNode(word) else { return false }
        return node.isCompleteWord
    }
    
    // returns true if there is any word in the Trie that starts with the given prefix
    func startsWith(_ prefix: String) -> Bool {
        guard let _ = getNode(prefix) else { return false }
        return true
    }
}
