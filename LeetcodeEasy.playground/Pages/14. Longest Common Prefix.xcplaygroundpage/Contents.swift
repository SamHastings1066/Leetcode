//class Solution {
//    func longestCommonPrefix(_ strs: [String]) -> String {
//        var i = 0
//        var charArray = [Character]()
//        var out = ""
//        
//        func allCharsEqual(in array: [Character]) -> Bool {
//            guard let firstChar = array.first else {return true}
//            return array.allSatisfy{$0 == firstChar}
//        }
//        
//        while allCharsEqual(in: charArray) {
//            //print(charArray)
//            charArray = strs.compactMap{ (str) -> Character? in
//                var character: Character?
//                if str.count>i {
//                     character = str[str.index(str.startIndex, offsetBy: i)]
//                } //else {
//                    // nil
//                //}
//                i+=1
//                if allCharsEqual(in: charArray) {
//                    out += String(charArray[0])
//                }
//                return character
//            }
//            
//        }
//        return out
//    }
//}

class Solution {
    // This solution first determines `minLength`, the count of the shortest string in the input `strs`, then slices each of the strings in strs to create an array of CHaracters taken form each at the index 0..<minLength. The algorithm stops when it gets to the point that these characters are not all equal and returns a list of teh characters up to this point. Time complexity is minLength x strs.count.
    func mySolution(_ strs: [String]) -> String {
        
        /// Returns true if all Characters are the same, flase otherwise
        func allCharsEqual(in array: [Character]) -> Bool {
            guard let firstChar = array.first else {return true}
            return array.allSatisfy{$0 == firstChar}
        }
        if strs.count == 1 {
            return strs[0]
        }

        var counts = strs.map{$0.count}
        let minLength = counts.min() ?? 0
        var maxIndex = -1
        for indexOffset in 0..<minLength{
            let charArray = strs.map{$0[$0.index($0.startIndex, offsetBy: indexOffset)]}
            if allCharsEqual(in: charArray) {
                maxIndex = indexOffset
            } else {
                break
            }
        }

        let substring = strs.first?.prefix(maxIndex+1)
        if maxIndex > -1, let result = substring {
            return String(result)
        } else {
            return ""
        }
    }
    
    // Best swift solution:
    // 1. The starting value for LCP is taken to be the first string in strs
    // 2. iterate through all strings in strs:
    // 3. For each string, drop all the characters in LCP until LCP is a prefix of that string
    // 4. return LCP
    func longestCommonPrefix(_ strs: [String]) -> String {
        if strs.isEmpty { return "" }
        var LCP = strs[0]
        for str in strs{
            while !str.hasPrefix(LCP) {
                LCP = String(LCP.dropLast())
            }
        }
        return LCP
    }
    
    func fastestLCP(_ strs: [String])  -> String {
        guard strs.count > 0 else { return ""}
        var LCP = ""
        let charsArray = strs.map{ Array($0) }
        var i = 0
        
        while true {
            var c: Character?
            for chars in charsArray {
                
                if i >= chars.count {
                    return LCP
                } else {
                    if c == nil {
                        c = chars[i]
                    } else if c != chars[i] {
                        return LCP
                    }
                }
            }
            
            LCP += String(c!)
            i += 1
            
        }
        
        return LCP
    }
}

 var strs = ["flower","flowpetal","flight"]
//var strs = ["ab", "a"]
let chars_array = strs.map({ Array($0) })



let solution = Solution()
solution.fastestLCP(strs)
solution.longestCommonPrefix(strs) // <-- this one is actually faster according to Leetcode!

