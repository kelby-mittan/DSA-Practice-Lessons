
import Foundation


/*
 1342. Number of Steps to Reduce a Number to Zero
 Easy
 
 Given a non-negative integer num, return the number of steps to reduce it to zero. If the current number is even, you have to divide it by 2, otherwise, you have to subtract 1 from it.
 
 Example 1:
 
 Input: num = 14
 Output: 6
 Explanation:
 Step 1) 14 is even; divide by 2 and obtain 7.
 Step 2) 7 is odd; subtract 1 and obtain 6.
 Step 3) 6 is even; divide by 2 and obtain 3.
 Step 4) 3 is odd; subtract 1 and obtain 2.
 Step 5) 2 is even; divide by 2 and obtain 1.
 Step 6) 1 is odd; subtract 1 and obtain 0.
 Example 2:
 
 Input: num = 8
 Output: 4
 Explanation:
 Step 1) 8 is even; divide by 2 and obtain 4.
 Step 2) 4 is even; divide by 2 and obtain 2.
 Step 3) 2 is even; divide by 2 and obtain 1.
 Step 4) 1 is odd; subtract 1 and obtain 0.
 Example 3:
 
 Input: num = 123
 Output: 12
 */

func numberOfSteps (_ num: Int) -> Int {
    var i = num
    var numOfSteps = 0
    
    while i > 0 {
        if i % 2 == 0 {
            i = i / 2
            numOfSteps += 1
        } else {
            i -= 1
            numOfSteps += 1
        }
    }
    
    return numOfSteps
}

//=====================================================================================

/*
 1221. Split a String in Balanced Strings
 Easy
 
 Balanced strings are those who have equal quantity of 'L' and 'R' characters.
 
 Given a balanced string s split it in the maximum amount of balanced strings.
 
 Return the maximum amount of splitted balanced strings.
 
 Example 1:
 
 Input: s = "RLRRLLRLRL"
 Output: 4
 Explanation: s can be split into "RL", "RRLL", "RL", "RL", each substring contains same number of 'L' and 'R'.
 Example 2:
 
 Input: s = "RLLLLRRRLR"
 Output: 3
 Explanation: s can be split into "RL", "LLLRRR", "LR", each substring contains same number of 'L' and 'R'.
 Example 3:
 
 Input: s = "LLLLRRRR"
 Output: 1
 Explanation: s can be split into "LLLLRRRR".
 Example 4:
 
 Input: s = "RLRRRLLRLL"
 Output: 2
 Explanation: s can be split into "RL", "RRRLLRLL", since each substring contains an equal number of 'L' and 'R'
 */

func balancedStringSplit(_ s: String) -> Int {
    var balance = 0
    var split = 0
    
    for char in s {
        if char == "L" {
            balance += 1
        } else {
            balance -= 1
        }
        
        if balance == 0 {
            split += 1
        }
    }
    
    return split
}

//=====================================================================================

/*
 860. Lemonade Change
 Easy
 
 At a lemonade stand, each lemonade costs $5.
 
 Customers are standing in a queue to buy from you, and order one at a time (in the order specified by bills).
 
 Each customer will only buy one lemonade and pay with either a $5, $10, or $20 bill.  You must provide the correct change to each customer, so that the net transaction is that the customer pays $5.
 
 Note that you don't have any change in hand at first.
 
 Return true if and only if you can provide every customer with correct change.
 
 Example 1:
 
 Input: [5,5,5,10,20]
 Output: true
 Explanation:
 From the first 3 customers, we collect three $5 bills in order.
 From the fourth customer, we collect a $10 bill and give back a $5.
 From the fifth customer, we give a $10 bill and a $5 bill.
 Since all customers got correct change, we output true.
 Example 2:
 
 Input: [5,5,10]
 Output: true
 Example 3:
 
 Input: [10,10]
 Output: false
 Example 4:
 
 Input: [5,5,10,10,20]
 Output: false
 Explanation:
 From the first two customers in order, we collect two $5 bills.
 For the next two customers in order, we collect a $10 bill and give back a $5 bill.
 For the last customer, we can't give change of $15 back because we only have two $10 bills.
 Since not every customer received correct change, the answer is false.
 */

func lemonadeChange(_ bills: [Int]) -> Bool {
    var five = 0
    var ten = 0
    for i in bills {
        if i == 5 {
            five += 1
        }
        else if i == 10 {
            five -= 1
            ten += 1
        }
        else if i == 20 && ten > 0 {
            ten -= 1
            five -= 1
        } else {
            five -= 3
        }
        if five < 0 {
            return false
        }
    }
    return true
}

//=====================================================================================

/*
 874. Walking Robot Simulation
 Easy
 
 A robot on an infinite grid starts at point (0, 0) and faces north.  The robot can receive one of three possible types of commands:
 
 -2: turn left 90 degrees
 -1: turn right 90 degrees
 1 <= x <= 9: move forward x units
 Some of the grid squares are obstacles.
 
 The i-th obstacle is at grid point (obstacles[i][0], obstacles[i][1])
 
 If the robot would try to move onto them, the robot stays on the previous grid square instead (but still continues following the rest of the route.)
 
 Return the square of the maximum Euclidean distance that the robot will be from the origin.
 
 Example 1:
 
 Input: commands = [4,-1,3], obstacles = []
 Output: 25
 Explanation: robot will go to (3, 4)
 Example 2:
 
 Input: commands = [4,-1,4,-2,4], obstacles = [[2,4]]
 Output: 65
 Explanation: robot will be stuck at (1, 4) before turning left and going to (1, 8)
 */

let multiplier: Int = 1000000
enum Direction {
    case north, south, west, east
    func turnLeft() -> Direction {
        switch self {
        case .north: return .west
        case .south: return .east
        case .west: return .south
        case .east: return .north
        }
    }
    func turnRight() -> Direction {
        switch self {
        case .north: return .east
        case .south: return .west
        case .west: return .north
        case .east: return .south
        }
    }
    func dx() -> Int {
        switch self {
        case .east: return 1
        case .west: return -1
        default: return 0
        }
    }
    func dy() -> Int {
        switch self {
        case .north: return 1
        case .south: return -1
        default: return 0
        }
    }
}
func zip(_ y: Int, _ x: Int) -> Int { return multiplier * (multiplier / 2 + y) + multiplier / 2 + x } // zip point to Int
func robotSim(_ commands: [Int], _ obstacles: [[Int]]) -> Int {
    var obstaclesDict: [Int: Bool] = [:]
    for obstacle in obstacles { obstaclesDict[zip(obstacle[1], obstacle[0])] = true } // convert to dictionary
    var curX: Int = 0
    var curY: Int = 0
    var curDirection: Direction = .north
    var result: Int = 0
    for command in commands {
        switch command {
        case -1:
            curDirection = curDirection.turnRight()
        case -2:
            curDirection = curDirection.turnLeft()
        default:
            for _ in 1...command {
                if obstaclesDict[zip(curY + curDirection.dy(), curX + curDirection.dx()), default: false] { break }
                curX += curDirection.dx()
                curY += curDirection.dy()
                result = max(result, curX * curX + curY * curY)
            }
        }
    }
    return result
}

//=====================================================================================

/*
 1266. Minimum Time Visiting All Points
 Easy

 On a plane there are n points with integer coordinates points[i] = [xi, yi]. Your task is to find the minimum time in seconds to visit all points.

 You can move according to the next rules:

 In one second always you can either move vertically, horizontally by one unit or diagonally (it means to move one unit vertically and one unit horizontally in one second).
 You have to visit the points in the same order as they appear in the array.
  

 Example 1:

 Input: points = [[1,1],[3,4],[-1,0]]
 Output: 7
 Explanation: One optimal path is [1,1] -> [2,2] -> [3,3] -> [3,4] -> [2,3] -> [1,2] -> [0,1] -> [-1,0]
 Time from [1,1] to [3,4] = 3 seconds
 Time from [3,4] to [-1,0] = 4 seconds
 Total time = 7 seconds
 
 Example 2:

 Input: points = [[3,2],[-2,2]]
 Output: 5
 */

func minTimeToVisitAllPoints(_ points: [[Int]]) -> Int {
    var seconds = 0
    for i in 0..<points.count - 1 {
        let x = points[i+1][0]-points[i][0]
        let y = points[i+1][1]-points[i][1]
        seconds += max(abs(x), abs(y))
    }
    return seconds
}

//=====================================================================================

/*
 1323. Maximum 69 Number
 Easy

 Given a positive integer num consisting only of digits 6 and 9.

 Return the maximum number you can get by changing at most one digit (6 becomes 9, and 9 becomes 6).

 Example 1:

 Input: num = 9669
 Output: 9969
 Explanation:
 Changing the first digit results in 6669.
 Changing the second digit results in 9969.
 Changing the third digit results in 9699.
 Changing the fourth digit results in 9666.
 The maximum number is 9969.
 Example 2:

 Input: num = 9996
 Output: 9999
 Explanation: Changing the last digit 6 to 9 results in the maximum number.
 Example 3:

 Input: num = 9999
 Output: 9999
 Explanation: It is better not to apply any change.
 */

func maximum69Number (_ num: Int) -> Int {
    var numArr = Array(String(num))

    for (i,n) in numArr.enumerated() {
        if n == "6" {
            numArr[i] = "9"
            break
        }
    }

    return Int(String(numArr))!
}

//=====================================================================================

/*
 832. Flipping an Image
 Easy

 Given a binary matrix A, we want to flip the image horizontally, then invert it, and return the resulting image.

 To flip an image horizontally means that each row of the image is reversed.  For example, flipping [1, 1, 0] horizontally results in [0, 1, 1].

 To invert an image means that each 0 is replaced by 1, and each 1 is replaced by 0. For example, inverting [0, 1, 1] results in [1, 0, 0].

 Example 1:

 Input: [[1,1,0],[1,0,1],[0,0,0]]
 Output: [[1,0,0],[0,1,0],[1,1,1]]
 Explanation: First reverse each row: [[0,1,1],[1,0,1],[0,0,0]].
 Then, invert the image: [[1,0,0],[0,1,0],[1,1,1]]
 Example 2:

 Input: [[1,1,0,0],[1,0,0,1],[0,1,1,1],[1,0,1,0]]
 Output: [[1,1,0,0],[0,1,1,0],[0,0,0,1],[1,0,1,0]]
 Explanation: First reverse each row: [[0,0,1,1],[1,0,0,1],[1,1,1,0],[0,1,0,1]].
 Then invert the image: [[1,1,0,0],[0,1,1,0],[0,0,0,1],[1,0,1,0]]
 */

func flipAndInvertImage(_ A: [[Int]]) -> [[Int]] {
    var flippedMatrix = [[Int]]()
    for arr in A {
        var flipped = [Int]()
        for num in arr {
            var n = num
            if n == 0 {
                n = 1
            } else {
                n = 0
            }
            flipped.insert(n, at: 0)
        }
        flippedMatrix.append(flipped)
    }
    return flippedMatrix
}

print(flipAndInvertImage([[1,1,0,0],[1,0,0,1],[0,1,1,1],[1,0,1,0]]))

//=====================================================================================

/*
 27. Remove Element
 Easy

 Given an array nums and a value val, remove all instances of that value in-place and return the new length.

 Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.

 The order of elements can be changed. It doesn't matter what you leave beyond the new length.

 Clarification:

 Confused why the returned value is an integer but your answer is an array?

 Note that the input array is passed in by reference, which means a modification to the input array will be known to the caller as well.

 Internally you can think of this:

 // nums is passed in by reference. (i.e., without making a copy)
 int len = removeElement(nums, val);

 // any modification to nums in your function would be known by the caller.
 // using the length returned by your function, it prints the first len elements.
 for (int i = 0; i < len; i++) {
     print(nums[i]);
 }
  

 Example 1:

 Input: nums = [3,2,2,3], val = 3
 Output: 2, nums = [2,2]
 Explanation: Your function should return length = 2, with the first two elements of nums being 2.
 It doesn't matter what you leave beyond the returned length. For example if you return 2 with nums = [2,2,3,3] or nums = [2,3,0,0], your answer will be accepted.
 Example 2:

 Input: nums = [0,1,2,2,3,0,4,2], val = 2
 Output: 5, nums = [0,1,4,0,3]
 Explanation: Your function should return length = 5, with the first five elements of nums containing 0, 1, 3, 0, and 4. Note that the order of those five elements can be arbitrary. It doesn't matter what values are set beyond the returned length.
 */

func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
    var index = 0
    for num in nums {
        if num != val {
            nums[index] = num
            index += 1
        } else {
            nums.remove(at: index)
        }
    }
    return index
}
