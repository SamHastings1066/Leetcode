class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        var result: [[Int]] = [[]]
        
        result[0] = [1]
        
        for i in 1..<numRows {
            var newRow = [1]
            var prevRow = result[i-1]
            for j in 1..<prevRow.count {
                newRow.append(prevRow[j] + prevRow[j-1])
            }
            newRow.append(1)
            result.append(newRow)
        }
        return result
    }
}

let solution = Solution()

print(solution.generate(5))
