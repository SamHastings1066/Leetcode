//class Solution {
//    func isHappy(_ n: Int) -> Bool {
//        var result = n
//        var prevResults = Set<Int>()
//        while !prevResults.contains(result) {
//            prevResults.insert(result)
//            var new = 0
//            while result > 0 {
//                new += (result % 10) * (result % 10)
//                result /= 10
//            }
//            if new == 1 {return true}
//            result = new
//        }
//        return false
//    }
//}

// Same solution a different way:
//class Solution {
//    func isHappy(_ n: Int) -> Bool {
//        var n = n
//        var seen = Set<Int>()
//        while n != 1 {
//            n = sos(n)
//            if seen.contains(n) { return false}
//            seen.insert(n)
//        }
//        return true
//    }
//
//    func sos(_ num: Int) -> Int {
//        var num = num
//        var ans = 0
//        while num > 0 {
//            let digit = num % 10
//            ans += digit * digit
//            num /= 10
//        }
//        return ans
//    }
//}

// Using Floyd's cycle-finding algorithm i.e. tortoise and hare
// O(log(n)) time; O(1) space
class Solution {
    func isHappy(_ n: Int) -> Bool {
        if n == 1 {return true}
        var tortoise = n
        var hare = sos(n)
        while tortoise != hare {
            if hare == 1 { return true}
            tortoise = sos(tortoise)
            hare = sos(sos(hare))
        }
        return false
    }

    func sos(_ num: Int) -> Int {
        var num = num
        var ans = 0
        while num > 0 {
            let digit = num % 10
            ans += digit * digit
            num /= 10
        }
        return ans
    }
}


print(Solution().isHappy(2))
