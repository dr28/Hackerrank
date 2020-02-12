import Foundation

/*
 You are given q queries. Each query is of the form two integers described below:
 - 1 x: Insert x in your data structure.
 - 2 y: Delete one occurence of y from your data structure, if present.
 - 3 z: Check if any integer is present whose frequency is exactly z. If yes, print 1 else 0.

 The queries are given in the form of a 2-D array queries of size q where queries[i][0] contains queries[i][1] the operation, and  contains the data element. For example, you are given array queries = [(1, 1), (2, 2), (3, 2), (1,1), (2, 1), (3,2 )] . The results of each operation are:

 Operation   Array   Output
 (1,1)       [1]
 (2,2)       [1]
 (3,2)                   0
 (1,1)       [1,1]
 (1,1)       [1,1,1]
 (2,1)       [1,1]
 (3,2)                   1
 Return an array with the output:[0,1] .

 Function Description

 Complete the freqQuery function in the editor below. It must return an array of integers where each element is a 1 if there is at least one element value with the queried number of occurrences in the current array, or 0 if there is not.

 freqQuery has the following parameter(s):

 * queries: a 2-d array of integers
 
 Input Format

 The first line contains of an integer d, the number of queries.
 Each of the next q lines contains two integers denoting the 2-d array queries.

 Constraints
 
 * 1 <= q <= 10^6
 * 1<= x,y,z <= 10^9
 * All queries[i][0] E {1, 2, 3}
 * 1 <= queries[i][1] <= 10^9

 Output Format

 Return an integer array consisting of all the outputs of queries of type 3.

 Sample Input 0

 8
 1 5
 1 6
 3 2
 1 10
 1 10
 1 6
 2 5
 3 2
 Sample Output 0

 0
 1
 
 Explanation 0

 For the first query of type 3, there is no integer whose frequency is 2 (array = [5, 6]). So answer is 0.
 For the second query of type 3, there are two integers in array=[6, 10, 10, 6] whose frequency is 2 (integers = 6 and 10). So, the answer is 1.

 Sample Input 1

 4
 3 4
 2 1003
 1 16
 3 1
 
 Sample Output 1

 0
 1
 
 Explanation 1

 For the first query of type 3, there is no integer of frequency 4. The answer is 0.
 For the second query of type 3, there is one integer, 16 of frequency 1 so the answer is 1.

 Sample Input 2

 10
 1 3
 2 3
 3 2
 1 4
 1 5
 1 5
 1 4
 3 2
 2 4
 3 2
 
 Sample Output 2

 0
 1
 1
 
 Explanation 2

 When the first output query is run, the array is empty. We insert two 4's and two 5's before the second output query, arr = [4, 5, 5, 4] so there are two instances of elements occurring twice. We delete a 4 and run the same query. Now only the instances of 5 satisfy the query.
 */




// Complete the freqQuery function below.
func freqQuery(queries: [[Int]]) -> [Int] {
    var ans = [Int]()
    let INSERT = 1
    let REMOVE = 2
    let QUERY = 3

    var value2count = [Int: Int]()
    var count2countOccurance = [Int: Int]()

    for q in queries {
        let type = q[0]
        let value = q[1]

        if type == INSERT {
            if value2count.keys.contains(value) {
                
                let oldCount = value2count[value]
                let newCount = oldCount! + 1

                value2count[value] = newCount

                count2countOccurance[oldCount!] = count2countOccurance[oldCount!]! - 1

                if !count2countOccurance.keys.contains(newCount) {
                    count2countOccurance[newCount] = 0
                }
                count2countOccurance[newCount] = count2countOccurance[newCount]! + 1
                
            } else {
                
                value2count[value] = 1
                if !count2countOccurance.keys.contains(1){
                    count2countOccurance[1] = 0
                }
                count2countOccurance[1] = count2countOccurance[1]! + 1
            }
        } else if type == REMOVE {
            if value2count.keys.contains(value) {
                let oldCount = value2count[value]
                let newCount = max(oldCount! - 1, 0)

                value2count[value] = newCount

                count2countOccurance[oldCount!] = count2countOccurance[oldCount!]! - 1

                if !count2countOccurance.keys.contains(newCount) {
                    count2countOccurance[newCount] = 0
                }
                count2countOccurance[newCount] = count2countOccurance[newCount]! + 1
            }
        } else if type == QUERY {
            if count2countOccurance.keys.contains(value) && count2countOccurance[value]!  > 0 {
                ans.append(1)
            } else {
                ans.append(0)
            }
        }
    }

    return ans


}


// had change the below boilerplate code to pass all test case

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let q = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

/*
 let queries: [[Int]] = AnyIterator{ readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) }.prefix(q).map {
     let queriesRow: [Int] = $0.split(separator: " ").map {
         if let queriesItem = Int($0) {
             return queriesItem
         } else { fatalError("Bad input") }
     }

     guard queriesRow.count == 2 else { fatalError("Bad input") }

     return queriesRow
 }
 */

var queries = [[Int]]()
while let raw = readLine() {
    guard raw.count >= 3, raw[raw.index(raw.startIndex, offsetBy: 1)] == " " else { fatalError("Bad input") }
    guard let op = Int("\(raw[raw.startIndex])"),
        let val = Int("\(raw[raw.index(raw.startIndex, offsetBy: 2)..<raw.endIndex])")
    else {
        fatalError("Bad input")
    }
    queries.append([op, val])

}

guard queries.count == q else { fatalError("Bad input") }

let ans = freqQuery(queries: queries)

fileHandle.write(ans.map{ String($0) }.joined(separator: "\n").data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
