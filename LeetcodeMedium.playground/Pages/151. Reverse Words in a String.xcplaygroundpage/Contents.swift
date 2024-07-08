// First approach
//class Solution {
//    func reverseWords(_ s: String) -> String {
//        var s = Array(s)
//        var ans: [Character] = []
//        var word: [Character] = []
//        for char in s {
//            if char == " " {
//                if !word.isEmpty {
//                    word.append(" ")
//                    ans.insert(contentsOf: word, at: 0)
//                    word = []
//                }
//            } else {
//                word.append(char)
//            }
//        }
//        word.append(" ")
//        ans.insert(contentsOf: word, at: 0)
//        ans.removeLast()
//        if let space = ans.first {
//            if space == " " { ans.removeFirst()}
//        }
//        return String(ans)
//    }
//}

// Cleaner implementation of above:
class Solution {
    func reverseWords(_ s: String) -> String {
        var ans: [String] = []
        var word: String = ""
        
        for char in s {
            if char == " " {
                if !word.isEmpty {
                    ans.insert(word, at: 0)
                    word = ""
                }
            } else {
                word.append(char)
            }
        }
        
        if !word.isEmpty {
            ans.insert(word, at: 0)
        }
        
        return ans.joined(separator: " ")
    }
}

// Swift in-built methods
//class Solution {
//    func reverseWords(_ s: String) -> String {
//        return s.split(separator: " ").reversed().joined(separator: " ")
//    }
//}


let s = "the sky is blue"

print (Solution().reverseWords(s))
