import UIKit

/*A left rotation operation on an array shifts each of the array's elements  unit to the left. For example, if  left rotations are performed on array [1, 2, 3, 4, 5], then the array would become [3, 4, 5, 1, 2].
Given an array a of n integers and a number, d, perform  left rotations on the array. Return the updated array to be printed as a single line of space-separated integers.
Function Description
Complete the function rotLeft in the editor below. It should return the resulting array of integers.
rotLeft has the following parameter(s):
An array of integers a.
An integer d, the number of rotations.
Input Format
The first line contains two space-separated integers n and d, the size of a and the number of left rotations you must perform.
The second line contains n space-separated integers a[i].
Constraints
 
 * 1 <= n <= 10^5
 * 1 <= d <= n
 * 1 <= a[i] <= 10^6
Output Format
 
Print a single line of n space-separated integers denoting the final state of the array after performing d left rotations.
Sample Input
5 4
1 2 3 4 5
Sample Output
5 1 2 3 4
Explanation
When we perform  left rotations, the array undergoes the following sequence of changes:
 
 [1, 2, 3, 4, 5] -> [2, 3, 4, 5, 1] -> [3, 4, 5, 1, 2] -> [4, 5, 1, 2, 3] -> [5, 1, 2, 3, 4]
 */

func rotLeft(a: [Int], d: Int) -> [Int] {

    guard !a.isEmpty else {
        return a
    }
    
    guard d <= a.count else {
        return []
    }
    
    var result = [Int]()
    var start = 0
    var rotadeInd = d

    while rotadeInd < a.count {
        result.insert(a[rotadeInd], at: start)
        start = start + 1
        rotadeInd = rotadeInd + 1
    }
    rotadeInd = 0
    while rotadeInd < d {
        result.insert(a[rotadeInd], at: start)
        start = start + 1
        rotadeInd = rotadeInd + 1
    }
    
    return result
}

//======================================================================
// RR = n-LR
//new index = (oldindex + (n-d))%n
func rotLeft1(a: [Int], d: Int) -> [Int] {
    guard !a.isEmpty else {
        return a
    }
    
    guard d <= a.count else {
        return []
    }
    let n = a.count
    var result = Array(repeating: 0, count: n)
    var oldInd = 0

    while oldInd < n {
        let newInd = (oldInd + n - d) % n

        result[newInd] = a[oldInd]
        oldInd = oldInd + 1
        
    }
    
    return result
}

//======================================================================
func rotLeft2(a: [Int], d: Int) -> [Int] { /// did not pass test case 8 Terminated due to timeout :( Your code did not execute within the time limits
    guard !a.isEmpty else {
        return a
    }
    
    guard d <= a.count else {
        return []
    }
    
    var result = a
    let start = 0
    let next = start + 1
    
    for  i in (0..<d) {
        let temp = a[i]
        let subarray = result[next..<a.count]
        result = []
        result.append(contentsOf: subarray)
        result.append(temp)
    }
    
    return result
}
