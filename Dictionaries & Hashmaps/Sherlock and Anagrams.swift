/*
 Two strings are anagrams of each other if the letters of one string can be rearranged to form the other string. Given a string, find the number of pairs of substrings of the string that are anagrams of each other.

 For example s = mom, the list of all anagrammatic pairs is [m, m], [mo, om] at positions [[0], [2]], [[0, 1], [1, 2]] respectively.

 Function Description

 Complete the function sherlockAndAnagrams in the editor below. It must return an integer that represents the number of anagrammatic pairs of substrings in s.

 sherlockAndAnagrams has the following parameter(s):

 * s: a string .
 
 Input Format

 The first line contains an integer q, the number of queries.
 Each of the next q lines contains a string s to analyze.

 Constraints

 1 <= q <= 10
 
 2 <= |s| <= 100

 String s contains only lowercase letters E ascii[a-z].

 Output Format

 For each query, return the number of unordered anagrammatic pairs.

 Sample Input 0

 2
 abba
 abcd
 
 Sample Output 0

 4
 0
 
 Explanation 0

 The list of all anagrammatic pairs is [a, a], [ab, ba], [b, b] and [abb, bba] at positions [[0], [3]], [[0,1], [2, 3]], [[1], [2]] and [[0, 1, 2], [1, 2, 3]] respectively.

 No anagrammatic pairs exist in the second query as no character repeats.

 Sample Input 1

 2
 ifailuhkqq
 kkkk
 
 Sample Output 1

 3
 10
 
 Explanation 1

 For the first query, we have anagram pairs [i, i], [q, q] and [ifa, fai] at positions [[0], [3]], [[8], [9]] and [[0, 1, 2], [1, 2, 3]] respectively.

 For the second query:
 There are 6 anagrams of the form [k, k] at positions [[0],[1], [[0], [2]], [[0], [3]], [[1], [2]], [[1], [3]] and [[2], [3]].
 There are 3 anagrams of the form [kk, kk] at positions [[0, 1], [1, 2]], [[0, 1], [2, 3]] and [[1, 2], [2, 3]].
 There is 1 anagram of the form [kkk, kkk] at position [[0, 1, 2], [1, 2, 3]].

 Sample Input 2

 1
 cdcd
 
 Sample Output 2

 5
 
 Explanation 2

 There are two anagrammatic pairs of length 1: [c, c] and [d, d].
 There are three anagrammatic pairs of length 2: [cd, dc], [cd, cd], [dc, cd] at positions [[0, 1], [1, 2]], [[0, 1], [2, 3]], [[1, 2], [2, 3]] respectively.
 */

func sherlockAndAnagrams(s: String) -> Int {
    /*let mapped = Array(s).map { ($0, 1)}
    let countDict = Dictionary(mapped, uniquingKeysWith: +)
    let duplicates1 = Array(Set(Array(s).filter({ (i: Character) in Array(s).filter({ $0 == i }).count > 1})))*/

    let duplicates = Array(s).filter({ (i: Character) in Array(s).filter({ $0 == i }).count > 1})
    print("dup \(duplicates)")

    guard !duplicates.isEmpty else {
        return 0
    }
    
    let subStrs = getAllSubstrings(s: s)
    
    var pairs = 0
    
    for (_, frequency) in subStrs{
        
        if frequency >= 2 {
            pairs += ((frequency * frequency) - frequency) / 2
        }
    }
    
    return pairs

}

func getAllSubstrings (s: String) -> [String: Int] {
    let input = Array(s.unicodeScalars)
    
    var length = 1
    
    var freqMap = [String:Int]()
    
    while length < input.count {
        
        for i in 0 ..< (input.count - (length - 1)) {
            
            let subStrArray = input[i..<(i + length)].sorted()
            
            let str = subStrArray.reduce("", {$0 + String($1)})
            
            if let frequency = freqMap[str] {
                
                freqMap[str] = frequency + 1
            } else {
                
                freqMap[str] = 1
            }
        }
        
        length += 1
    }
    return freqMap
    
}

sherlockAndAnagrams(s: "abba")
sherlockAndAnagrams(s: "kkkk") //10

