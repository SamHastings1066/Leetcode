// First approach
//class Solution {
//    func wordPattern(_ pattern: String, _ s: String) -> Bool {
//        var s = s.split(separator: " ")
//        var pattern = Array(pattern)
//        var sFO = [String: Int]() // s First Occurrence
//        var pFO = [Character: Int]() // pattern First Occurrence
//        guard pattern.count == s.count else { return false }
//        for i in 0..<s.count {
//            if pFO[pattern[i]] != sFO[String(s[i])] {
//                return false
//            } else {
//                pFO[pattern[i]] = i
//                sFO[String(s[i])] = i
//            }
//        }
//        return true
//    }
//}

// Second approach
class Solution {
    func wordPattern(_ pattern: String, _ s: String) -> Bool {
        var s = s.split(separator: " ")
        var pattern = Array(pattern)
        guard s.count == pattern.count else { return false }
        var hashMap = [Character: String.SubSequence]()
        
        for i in 0..<s.count {
            if hashMap[pattern[i]] ==  nil {
                hashMap[pattern[i]] = s[i]
            } else {
                if hashMap[pattern[i]] != s[i] { return false }
            }
        }
        
        return hashMap.keys.count == Set(hashMap.values).count
    }
}


var pattern = "aaa"
var s = "aa aa aa aa"

print(Solution().wordPattern(pattern, s))
