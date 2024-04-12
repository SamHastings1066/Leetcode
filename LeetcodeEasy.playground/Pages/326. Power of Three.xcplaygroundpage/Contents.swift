// Loop
//class Solution {
//    func isPowerOfThree(_ n: Int) -> Bool {
//        if n == 1 {return true}
//        var n = n
//        while n > 0 {
//            if n % 3 != 0 {return false}
//            n /= 3
//            if n == 1 { return true }
//        }
//        return false
//    }
//}

// Recursion
class Solution {
    func isPowerOfThree(_ n: Int) -> Bool {
        var n = n
        if n == 1 {return true}
        if n == 0 {return false}
        if n % 3 != 0 {return false}
        n /= 3
        return isPowerOfThree(n)
    }
}

print(Solution().isPowerOfThree(26))
