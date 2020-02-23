"""
 Given 3 arrays a, b, c of different sizes, find the number of distinct triplets (p, q, r) where p is an element of a, written as p epsilon a, q epsilon b, and r epsilon c, satisfying the criteria: p <= q and q >= r.

 For example, given a = [3, 5, 7], b = [3, 6] and c = [4, 6, 9], we find four distinct triplets: (3, 6, 4), (3, 6, 6), (5, 6, 4), (5, 6, 6).

 Function Description

 Complete the triplets function in the editor below. It must return the number of distinct triplets that can be formed from the given arrays.

 triplets has the following parameter(s):

 * a, b, c: three arrays of integers .
 
 Input Format

 The first line contains 3 integers lena, lenb and lenc the sizes of the three arrays.
 The next 3 lines contain space-separated integers numbering lena, lenb and lenc respectively.

 Constraints

 1 <= lena, lenb and lenc < 10^5
 1 <= all elements in a, b, c <= 10^5

 Output Format

 Print an integer representing the number of distinct triplets.

 Sample Input 0

 3 2 3
 1 3 5
 2 3
 1 2 3
 
 Sample Output 0

 8
 
 Explanation 0

 The special triplets are (1, 2, 1), (1, 2, 2), (1, 3, 1), (1, 3, 2), (1, 3, 3), (3, 3, 1), (3, 3, 2), (3, 3, 3) .

 Sample Input 1

 3 3 3
 1 4 5
 2 3 3
 1 2 3
 
 Sample Output 1

 5
 
 Explanation 1

 The special triplets are (1, 2, 1), (1, 2, 2), (1, 3, 1), (1, 3, 2), (1, 3, 3)

 Sample Input 2

 4 3 4
 1 3 5 7
 5 7 9
 7 9 11 13
 
 Sample Output 2

 12
 
 Explanation 2

 The special triplets are (1, 7, 7), (1, 9, 7), (1, 9, 9), (3, 7, 7), (3, 9, 7), (3, 9, 9), (5, 7, 7), (5, 9, 7), (5, 9, 9), (7, 7, 7), (7, 9, 7), (7, 9, 9).
 
"""

def triplets(a, b, c):
    a = sorted(set(a))
    b = sorted(set(b))
    c = sorted(set(c))
    result, i, j, p, r = 0, 0, 0, 0, 0
    for q in b:
        while i < len(a) and a[i] <= q:
            p += 1
            i += 1
        while j < len(c) and c[j] <= q:
            r += 1
            j += 1
        result += p * r
    return result
