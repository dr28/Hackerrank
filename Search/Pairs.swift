/*
 
 You will be given an array of integers and a target value. Determine the number of pairs of array elements that have a difference equal to a target value.

 For example, given an array of [1, 2, 3, 4] and a target value of 1, we have three values meeting the condition: 2 - 1 = 1, 3 - 2 = 1, and 4 - 3 = 1.

 Function Description

 Complete the pairs function below. It must return an integer representing the number of element pairs having the required difference.

 pairs has the following parameter(s):

 k: an integer, the target difference
 arr: an array of integers
 Input Format

 The first line contains two space-separated integers n and k, the size of arr and the target value.
 The second line contains n space-separated integers of the array arr.

 Constraints
 
 * 2 <= n <= 10^5
 * 0 < k <= 10^9
 * 0 < arr[i] <= 2^31 - 1

 each integer arr[i] will be unique
 
 Output Format

 An integer representing the number of pairs of integers whose difference is k.

 Sample Input

 5 2
 1 5 3 4 2
 
 Sample Output

 3
 
 Explanation

 There are 3 pairs of integers in the set with a difference of 2: [5,3], [4,2] and [3,1] .

 Welcome to the dark
 
 */

import Foundation


func pairs(k: Int, arr: [Int]) -> Int {
    var pairCnt = 0
    var arr = arr
    arr.sort { (a, b) -> Bool in
        return a < b
    }
    //print(arr)
    //var map = [Int:Int]()
    var l = 0
    var r = 0
    
    while r < arr.count {
        
       // print("arr[i] - k \(arr[i] - k)")
      //  print("arr[j] \(arr[j])")

        if arr[r] - arr[l] == k {
            pairCnt += 1
            l += 1
            r += 1
        } else if arr[r] - arr[l] > k {
            l += 1
            
        } else {
            r += 1
        }
    }
    return pairCnt
}

def pairs(k, arr):
count = 0
l = 0
r = 0
arr.sort()

while r < len(arr) :

    if arr[r] - arr[l] == k :
        count += 1
        l += 1
        r += 1
    elif arr[r] - arr[l] > k:
        l += 1
    else :
        r += 1

return count
