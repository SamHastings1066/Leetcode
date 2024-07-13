// First
//class Solution {
//    func isIsomorphic(_ s: String, _ t: String) -> Bool {
//        guard Set(s).count == Set(t).count else {return false}
//        var s = Array(s)
//        var t = Array(t)
//        var s2t = [Character:Character]()
//        for i in 0..<s.count {
//            if let tChar = s2t[s[i]] {
//                if tChar != t[i] { return false }
//            } else {
//                s2t[s[i]] = t[i]
//            }
//        }
//        return true
//    }
//}


// Second
//class Solution {
//    func isIsomorphic(_ s: String, _ t: String) -> Bool {
//        guard s.count == t.count else {return false}
//        var s = Array(s)
//        var t = Array(t)
//        var s2t = [Character:Character]()
//        var t2s = [Character:Character]()
//        for i in 0..<s.count {
//            if s2t[s[i]] != nil || t2s[t[i]] != nil {
//                if s2t[s[i]] != t[i] || t2s[t[i]] != s[i]  { return false }
//            } else {
//                s2t[s[i]] = t[i]
//                t2s[t[i]] = s[i]
//            }
//        }
//        return true
//    }
//}

//First occurence map
class Solution {
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else {return false}
        var sFirstOccurence = [Character: String.Index]()
        var tFirstOccurence = [Character: String.Index]()
        for i in s.indices {
            if sFirstOccurence[s[i]] != tFirstOccurence[t[i]] {
                return false
            } else {
                sFirstOccurence[s[i]] = i
                tFirstOccurence[t[i]] = i
            }
        }
        return true
    }
}

var s = "paper", t = "title"

print(Solution().isIsomorphic(s, t))
