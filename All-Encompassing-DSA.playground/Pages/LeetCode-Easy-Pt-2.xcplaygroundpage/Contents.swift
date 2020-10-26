//: [Previous](@previous)

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
