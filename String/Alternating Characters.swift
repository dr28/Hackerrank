/*
 
 You are given a string containing characters A and B only. Your task is to change it into a string such that there are no matching adjacent characters. To do this, you are allowed to delete zero or more characters in the string.

 Your task is to find the minimum number of required deletions.

 For example, given the string s = AABAAAB, remove an a at positions 0 and 3 to make s = ABAB in  deletions.

 Function Description

 Complete the alternatingCharacters function in the editor below. It must return an integer representing the minimum number of deletions to make the alternating string.

 alternatingCharacters has the following parameter(s):

 s: a string
 
 Input Format

 The first line contains an integer q, the number of queries.
 The next q lines each contain a string s.

 Constraints
 
 * 1 <= q <= 10
 * 1 <= \s\ <= 10^5
 * Each string s will consist only of characters A and B

 Output Format

 For each query, print the minimum number of deletions required on a new line.

 Sample Input

 5
 AAAA
 BBBBB
 ABABABAB
 BABABA
 AAABBB
 
 Sample Output

 3
 4
 0
 0
 4
 
 Explanation

 The characters marked red are the ones that can be deleted so that the string doesn't have matching consecutive characters.

 A AAA -> A (3 deletions)
 B BBBB -> B (4 deletions)
 ABABABAB -> ABABABAB (0 deletions)
 BABABA -> BABABA (0 deletions)
 A AA B BB -> AB (4 deletion)
 
 */
func alternatingCharacters(s: String) -> Int {
    var result = 0
    
    var i = s.startIndex
    var j = s.index(i, offsetBy: 1)
    
    while i < s.endIndex && j < s.endIndex {
        
        if s[i] == s[j] {
            result = result + 1
            j = s.index(j, offsetBy: 1)
            
        } else {
            var temp = j
            j = s.index(j, offsetBy: 1)
            i = temp
        }
    }

    return result
}
