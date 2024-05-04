//Solution using sorting
//class Solution {
//    func groupAnagrams(_ strs: [String]) -> [[String]] {
//        var strs = strs
//        var ans = [String:[String]]()
//        for s in strs {
//            ans[String(s.sorted()), default: []].append(s)
//        }
//        
//        return ans.values.map{$0}
//    }
//}

// Using count of asciiValues
class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var ans = [[Int]:[String]]()
        for s in strs {
            ans[charMap(s), default: []].append(s)
        }
        
        return ans.values.map{$0}
    }
    func charMap(_ s: String) -> [Int] {
        var ans = Array(repeating: 0, count: 26)
        for char in s {
            ans[Int(char.asciiValue!) - 97] += 1
        }
        return ans
    }
}


var strs = ["eat","tea","tan","ate","nat","bat"]


print(Solution().groupAnagrams(strs))
