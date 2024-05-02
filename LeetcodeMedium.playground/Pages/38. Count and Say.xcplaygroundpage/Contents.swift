// First attempt; recursion
//class Solution {
//    func countAndSay(_ n: Int) -> String {
//        if n == 1 { return "1"}
//        
//        var current = ""
//        var last: String? = nil
//        var count = 1
//        var ans = ""
//        
//        var string = countAndSay(n-1)
//        while string.count != 0 {
//            current = String(string.removeLast())
//            if let last = last {
//                if current != last {
//                    ans = String(count) + String(last) + ans
//                    count = 1
//                } else {
//                    count += 1
//                }
//            }
//            last = current
//        }
//        ans = String(count) + String(last!) + ans
//        return ans
//    }
//}

// Iterative:

class Solution {
    func countAndSay(_ n: Int) -> String {
        var current = ["1"]
        for _ in 1..<n {
            var next: Array<String> = []
            var j = 0
            var k = 0
            while j < current.count {
                while k < current.count && current[j] == current[k] {
                    k+=1
                }
                next.append(String(k-j))
                next.append(current[j])
                j=k
            }
            current = next
        }
        return current.joined()
    }
}

print(Solution().countAndSay(11))
