/*
You are given an m×n grid. Start at the bottom-left corner of the grid (0,0) and move to the bottom-right corner (0,n−1).

From any cell, you can move:
- Right (stay in the same row),
- Up-right (move to the row above, if within bounds),
- Down-right (move to the row below, if within bounds).

You cannot leave the grid. Write a function in Swift that returns the total number of distinct paths from the start to the destination.

Constraints:

1≤m,n≤100
The grid is empty; no obstacles.

Example:

For a 5×5 grid:

☐ ☐ ☐ ☐ ☐
☐ ☐ ☐ ☐ ☐
☐ ☐ ☐ ☐ ☐
☐ ☐ ☐ ☐ ☐
S ☐ ☐ ☐ E

Start: S=(0,0)
End: E=(0,4)
 See Unique Paths problems on LeetCode
*/

func totalPaths(_ m: Int, _ n: Int) -> Int {
    var memo = [[Int]: Int]()
    return countPaths(0,0)
    
    
    func countPaths(_ i: Int, _ j: Int) -> Int {
        if let ans = memo[[i,j]] { return ans }
        if i == 0, j == n-1 {
            memo[[i,j]] = 1
            return 1
        }
        if i<0 || i>=m || j>=n {
            memo[[i,j]] = 0
            return 0
        }
        let ans =  countPaths(i, j + 1) + countPaths(i + 1, j + 1) + countPaths(i - 1, j + 1)
        memo[[i,j]] = ans
        return ans
    }
}

print(totalPaths(4, 4))
