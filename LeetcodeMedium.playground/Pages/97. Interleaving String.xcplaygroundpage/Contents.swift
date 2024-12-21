
/*
 Brute force:

 1) Create all possible intervleavings of s1 and s2,
 2) Check if any of them equal s3

 Create all possible intervleavings of s1 and s2,

*/


//class Solution {
//    func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
//        // Check if lengths match
//        if s1.count + s2.count != s3.count { return false }
//
//        var possibleStrings = [String]()
//        
//        createInterleavings("", Array(s1), Array(s2))
//        
//        return possibleStrings.contains(s3)
//        
//        func createInterleavings(_ path: String, _ s1: [Character], _ s2: [Character]) {
//            // If the path has reached the same length as s3, add it to possible strings
//            if path.count == s3.count {
//                possibleStrings.append(path)
//                return
//            }
//            
//            // If there are characters left in s1, take the first character and recurse
//            if !s1.isEmpty {
//                createInterleavings(path + String(s1[0]), Array(s1.dropFirst()), s2)
//            }
//            
//            // If there are characters left in s2, take the first character and recurse
//            if !s2.isEmpty {
//                createInterleavings(path + String(s2[0]), s1, Array(s2.dropFirst()))
//            }
//        }
//    }
//}

//class Solution {
//    func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
//        // Check if lengths match
//        if s1.count + s2.count != s3.count { return false }
//
//        var possibleStrings = [String]()
//        
//        createInterleavings("", Array(s1), Array(s2))
//        
//        return possibleStrings.contains(s3)
//        
//        func createInterleavings(_ path: String, _ s1: [Character], _ s2: [Character]) {
//            // If the path has reached the same length as s3, add it to possible strings
//            if path.count == s3.count {
//                possibleStrings.append(path)
//                return
//            }
//            
//            // If there are characters left in s1, take the first character and recurse
//            if !s1.isEmpty {
//                createInterleavings(path + String(s1[0]), Array(s1.dropFirst()), s2)
//            }
//            
//            // If there are characters left in s2, take the first character and recurse
//            if !s2.isEmpty {
//                createInterleavings(path + String(s2[0]), s1, Array(s2.dropFirst()))
//            }
//        }
//    }
//}

// DP approach

class Solution {
    func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
        // Check if lengths match
        if s1.count + s2.count != s3.count { return false }
        if s3.count == 0 { return true }
        let s1 = Array(s1)
        let s2 = Array(s2)
        let s3 = Array(s3)
        
        var memo = Array(repeating: Array(repeating: -1, count: s2.count), count: s1.count)
        return dp(0,0) > 0
        
        func dp(_ i: Int, _ j: Int) -> Int {
            if i == s1.count-1 {
                return s2.last! == s3.last! ? 1 : 0
            }
            if j == s2.count-1 {
                return s1.last! == s3.last! ? 1 : 0
            }
            if memo[i][j] == -1 {
                memo[i][j] = dp(i, j+1) + dp(i+1, j) > 0 ? 1 : 0
            }
            
            return memo[i][j]
        }
    }
}

let s1 = "aabcc"
let s2 = "dbbca"
let s3 = "aadbbcbcac"

print(Solution().isInterleave(s1, s2, s3))
