class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        let m = matrix.count
        let n = matrix[0].count
        
        if target < matrix[0][0] || target > matrix[m-1][n-1] {
            return false
        }
        
        var l = 0
        var r = (m * n) - 1
        
        while l<=r {
            let mid = l + (r - l)/2
            let midValue = matrix[mid/n][mid%n]
            if midValue == target {
                return true
            } else if midValue > target {
                r = mid - 1
            } else {
                l = mid + 1
            }
        }
        return false
    }
}

let matrix = [[1,3]]
let target = 3

print(Solution().searchMatrix(matrix, target))
