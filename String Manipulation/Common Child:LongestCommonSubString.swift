/*
 A string is said to be a child of a another string if it can be formed by deleting 0 or more characters from the other string. Given two strings of equal length, what's the longest string that can be constructed such that it is a child of both?

 For example, ABCD and ABDC have two children with maximum length 3, ABC and ABD. They can be formed by eliminating either the D or C from both strings. Note that we will not consider ABCD as a common child because we can't rearrange characters and ABCD <> ABDC.

 Function Description

 Complete the commonChild function in the editor below. It should return the longest string which is a common child of the input strings.

 commonChild has the following parameter(s):

 * s1, s2: two equal length strings
 
 Input Format

 There is one line with two space-separated strings, s1 and s1.

 Constraints
 
 * 1<= |s1|, |s2| <= 5000
 * All characters are upper case in the range ascii[A-Z].
 
 Output Format

 Print the length of the longest string s, such that s is a child of both s1 and s2.

 Sample Input

 HARRY
 SALLY
 
 Sample Output

  2
 
 Explanation

 The longest string that can be formed by deleting zero or more characters from HARRY and SALLY is AY, whose length is 2.

 Sample Input 1

 AA
 BB
 
 Sample Output 1

 0
 
 Explanation 1

 AA and BB have no characters in common and hence the output is 0.

 Sample Input 2

 SHINCHAN
 NOHARAAA
 
 Sample Output 2

 3
 
 Explanation 2

 The longest string that can be formed between SHINCHAN and NOHARAAA while maintaining the order is NHA.

 Sample Input 3

 ABCDEF
 FBDAMN
 
 Sample Output 3

 2
 
 Explanation 3
 BD is the longest child of the given strings.
 
 */
// Using DP - if characters equal, take previous substring and add 1, if not equal take max of temp[i][j-1] & temp [i-1][j]. To get the string travere back and record the character for each diagonal shift.

func commonChild(s1: String, s2: String) -> Int {
    var result = 0
    
    let s1Arr = s1.map {String($0)}
    let s2Arr = s2.map {String($0)}

    let temp1 = Array(repeating: 0, count: s1.count+1)
    var temp = Array(repeating: temp1, count: s2.count+1)

    for i in 1..<temp.count {
        for j in 1..<temp[1].count {

            if s1Arr[i-1] == s2Arr[j-1] {

                temp[i][j] = temp[i - 1][j - 1] + 1
            } else {
                temp[i][j] = max(temp[i][j-1],temp[i-1][j])

            }

            if temp[i][j] > result {
                result = temp[i][j]
            }
        }
        
    }
    
    return result
}
