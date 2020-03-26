import UIKit

// problem 1
// discuss the four sorting algorithms we did in class: Bubble sort, Insertion sort, Quick sort and Merge sort
// desciption of how they work e.g which uses divide and conquer, which uses a pivot
// runtime complexity,
// space complexity,
// https://bigocheatsheet.com



// problem 2
// implement the following binary tree and print the nodes such that the output is
// Encyclopedia, Science, Culture, Art and Craft
/*
 
     Encyclopedia
     /          \
   Science     Culture
                /  \
              Art Craft
 */
class BinaryTreeNode<S> {
    var value: S
    var leftChild: BinaryTreeNode? // this is a class
    var rightChild: BinaryTreeNode? // and its optional so it has a value of nil because its of type class BinaryTreeNode
    
    init(_ value: S){
        self.value = value
    }
}

extension BinaryTreeNode {
    // in order traversal
    // rules
    
    /*
     visit left child recursively
     visit node
     visit right child recursively
     */
    
    func inOrderTraversal(visit: (BinaryTreeNode) -> () ) {
        // this is a visit closure
        leftChild?.inOrderTraversal(visit: visit) // keep calling untill there is nothing left on the left side then move on to right
        visit(self)
        rightChild?.inOrderTraversal(visit: visit)
        
    }
    
    //  closures captures values (stores them for use a call time)
    func preOrderTraversal(visit: (BinaryTreeNode) -> () ){
        visit(self)
        leftChild?.preOrderTraversal(visit: visit)
        rightChild?.preOrderTraversal(visit: visit)
    }
    
    
    func postOrderTraversal(visit: (BinaryTreeNode) -> () ){
        leftChild?.postOrderTraversal(visit: visit)
        rightChild?.postOrderTraversal(visit: visit)
        visit(self)
    }
    
    
}

let treeNode = BinaryTreeNode<String>("Enyclopedia")
let twoNode = BinaryTreeNode<String>("Science")
let threeNode = BinaryTreeNode<String>("Culture")
let fourNode = BinaryTreeNode<String>("Arts")
let fiveNode = BinaryTreeNode<String>("Crafts")

treeNode.leftChild = twoNode
treeNode.rightChild = threeNode
threeNode.leftChild = fourNode
threeNode.rightChild = fiveNode

treeNode.preOrderTraversal { (node) in
    print(node.value, terminator: " ")
}

// problem 3
// https://leetcode.com/problems/sort-an-array/ // [5 3 2 0]

func sortArray(_ nums: [Int]) -> [Int] {
    
    guard nums.count > 1 else { return nums }
    let middleIndex = nums.count / 2
    let leftArr = sortArray(Array(nums[..<middleIndex]))
    let rightArr = sortArray(Array(nums[middleIndex..<nums.count]))
    
    return merge(leftArr, rightArr)
}

func merge(_ leftArr: [Int], _ rightArr: [Int]) -> [Int] {
    
    var leftIndex = 0
    var rightIndex = 0
    
    var resultsArr = [Int]()
    
    while leftIndex < leftArr.count && rightIndex < rightArr.count {
        let leftElement = leftArr[leftIndex]
        let rightElement = rightArr[rightIndex]
        if leftElement < rightElement {
            resultsArr.append(leftElement)
            leftIndex += 1
        } else if leftElement > rightElement {
            resultsArr.append(rightElement)
            rightIndex += 1
        } else {
            resultsArr.append(leftElement)
            leftIndex += 1
            resultsArr.append(rightElement)
            rightIndex += 1
        }
    }
    if leftIndex < leftArr.count {
        resultsArr.append(contentsOf: leftArr[leftIndex...])
    }
    
    if rightIndex < rightArr.count {
        resultsArr.append(contentsOf: rightArr[rightIndex...])
    }
    
    return resultsArr
}

sortArray([5, 3, 2, 0])

// problem 4
// https://leetcode.com/problems/find-words-that-can-be-formed-by-characters/

// Input: words = ["cat","bt","hat","tree"], chars = "atach"
//Output: 6
//Explanation:
//The strings that can be formed are "cat" and "hat" so the answer is 3 + 3 = 6.
//Input: words = ["hello","world","leetcode"], chars = "welldonehoneyr"
//Output: 10
func countCharacters(_ words: [String], _ chars: String) -> Int {
    
//    guard words.count <= 1000 else { return 0 }
//    guard chars.count <= 100 else { return 0 }
    
//    var letterArr = [String]()
//
//    for letter in chars {
//        letterArr.append(String(letter))
//    }
    
    let str = chars
    let setChars = Set(chars)
    var charArr = [Character]()
    for word in words {
        let setWord = Set(word)
//        let mappedItems = letterArr.map { ($0, 1) }
//        let counts = Dictionary(mappedItems, uniquingKeysWith: +)
//        print(counts)
        if setWord.isSubset(of: setChars) {
            for char in word {
                if str.contains(char) {
                    charArr.append(char)
                }
            }
        }
    }
    return charArr.count
}

countCharacters(["hello","world","leetcode"], "welldonehoneyr")

func mult(x: Int, y: Int) -> Int {
    if x == 0 || y == 0 {
        return 0
    }

    if x == 1 {
        return y
    } else if y == 1 {
        return x
    }

    return mult(x: x-1, y: y) + y
}

mult(x: 10, y: 11)


