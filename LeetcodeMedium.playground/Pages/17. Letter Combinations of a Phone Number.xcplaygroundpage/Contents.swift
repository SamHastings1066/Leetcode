
// My first solution
//class Solution {
//    
//    var numMap = [
//        "2": "abc",
//        "3": "def",
//        "4": "ghi",
//        "5": "jkl",
//        "6": "mno",
//        "7": "pqrs",
//        "8": "tuv",
//        "9": "wxyz",
//    ]
//    
//    func letterCombinations(_ digits: String) -> [String] {
//        var rtnString = [String]()
//        if digits.isEmpty {return rtnString}
//        var digits = Array(digits).map{String($0)}
//        let pop = digits.removeFirst()
//        let strings = Array(numMap[pop]!).map{String($0)}
//        if digits.isEmpty {
//            return strings
//        }
//        
//        
//        for string in strings {
//            let nextStrings = letterCombinations(digits.joined())
//            for nextString in nextStrings {
//                rtnString.append(string+nextString)
//            }
//        }
//        
//        return rtnString
//    }
//}

// Backtracking
class Solution {

    func letterCombinations(_ digits: String) -> [String] {
        guard digits != "" else {return []}
        var res = [String]()
        var map : [Character: [Character]] = [
            "2": ["a","b","c"],
            "3": ["d","e","f"],
            "4": ["g","h","i"],
            "5": ["j","k","l"],
            "6": ["m","n","o"],
            "7": ["p","q","r", "s"],
            "8": ["t","u","v"],
            "9": ["w","x","y", "z"]
        ]
        var digits = Array(digits)
        
        func backtrack(_ path: [Character]) {
            let len = digits.count
            let index = path.count
            var path = path
            if len == index {
                res.append(String(path))
                return
            }
            for c in map[digits[index]]! {
                path.append(c)
                backtrack(path)
                path.remove(at: path.count - 1)
            }
        }
        
        backtrack([])
        
        return res
    }
}

print(Solution().letterCombinations("23"))
