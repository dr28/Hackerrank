/*
 
 Given two strings, determine if they share a common substring. A substring may be as small as one character.

 For example, the words "a", "and", "art" share the common substring a. The words "be" and "cat" do not share a substring.

 Function Description

 Complete the function twoStrings in the editor below. It should return a string, either YES or NO based on whether the strings share a common substring.

 twoStrings has the following parameter(s):
 *s1, s2: two strings to analyze .
 
 Input Format

 The first line contains a single integer p, the number of test cases.

 The following p pairs of lines are as follows:

 The first line contains string s1.
 The second line contains string s2.
 
 Constraints

 * s1 and s2 consist of characters in the range ascii[a-z].
 * 1 <= p <= 10
 * 1 <= |s1|, |s2| <= 10^5
 
 Output Format

 For each pair of strings, return YES or NO.

 Sample Input

 2
 hello
 world
 hi
 world
 
 Sample Output

 YES
 NO
 
 Explanation

 We have p = 2 pairs to check:

 1. s1 = "hello", s2 = "world". The substrings "o" and "l" are common to both strings.
 2. a = "hi", b = "world". s1 and s2 share no common substrings.
  
 */

func twoStrings(s1: String, s2: String) -> String {
    
    let s1CharArray = Array(s1)
    let s2CharArray = Array(s2)
    
    let ss1 = Set(s1CharArray)
    let ss2 = Set(s2CharArray)

    return ss1.intersection(ss2).isEmpty ? "NO" : "YES"
    

}
