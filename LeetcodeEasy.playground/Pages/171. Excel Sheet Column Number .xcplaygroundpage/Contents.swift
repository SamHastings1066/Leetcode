class Solution {
    func titleToNumber(_ columnTitle: String) -> Int {
        //columnTitle.unicodeScalars.reduce(0, {$0 * 26 + Int($1.value) - 64})
        var result = 0
        for c in columnTitle.unicodeScalars {
            result = result * 26 + Int(c.value) - 64
        }
        return result
    }
}


print(Solution().titleToNumber("AA"))
