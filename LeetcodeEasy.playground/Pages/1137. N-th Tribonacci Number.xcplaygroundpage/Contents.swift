class Solution {
    func tribonacci(_ n: Int) -> Int {
        var tribNums = [0,1,1]
        if n > 2 {
            for i in 3...n {
                tribNums.append(tribNums[i-1] + tribNums[i-2] + tribNums[i-3])
            }
        }
        return tribNums[n]
    }
}
