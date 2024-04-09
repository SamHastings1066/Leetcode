class Solution {
    func isHappy(_ n: Int) -> Bool {
        var result = n
        var prevResults = Set<Int>()
        while !prevResults.contains(result) {
            prevResults.insert(result)
            var new = 0
            while result > 0 {
                new += (result % 10) * (result % 10)
                result /= 10
            }
            if new == 1 {return true}
            result = new
        }
        return false
    }
}


print(Solution().isHappy(2))
