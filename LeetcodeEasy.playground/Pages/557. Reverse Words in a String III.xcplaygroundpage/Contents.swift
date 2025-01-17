// Time: O(n), Space: O(n)
//class Solution {
//    func reverseWords(_ s: String) -> String {
//        var words = s.split(separator: " ").map{String($0)}
//        for i in words.indices {
//            var word = Array(words[i])
//            var start = 0
//            var end = word.count - 1
//            while start<end {
//                (word[start],word[end]) = (word[end],word[start])
//                start += 1
//                end -= 1
//            }
//            words[i] = String(word)
//        }
//        return words.joined(separator: " ")
//    }
//}

// Time: O(n), space: O(1)
class Solution {
    func reverseWords(_ s: String) -> String {
        var lastSpaceIndex = -1
        var chArray = Array(s) // Convert String to Array of Characters
        let len = s.count
        
        for strIndex in 0...len { // Iterate through all indices including len
            if strIndex == len || chArray[strIndex] == " " {
                var startIndex = lastSpaceIndex + 1
                var endIndex = strIndex - 1
                
                // Reverse the word between startIndex and endIndex
                while startIndex < endIndex {
                    (chArray[startIndex],chArray[endIndex]) = (chArray[endIndex],chArray[startIndex])
                    startIndex += 1
                    endIndex -= 1
                }
                
                lastSpaceIndex = strIndex
            }
        }
        
        return String(chArray) // Convert Array back to String
    }
}
