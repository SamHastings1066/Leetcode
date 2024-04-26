class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        var ans = [String]()
        var currString = ""
        backtracking(0, 0)
        return ans
        
        func backtracking(_ leftCount: Int, _ rightCount: Int) {
            
            if currString.count == 2*n {
                ans.append(currString)
                return
            }
            
            if leftCount < n {
                currString.append("(")
                backtracking(leftCount + 1, rightCount)
                currString.removeLast()
            }
            
            if rightCount < leftCount {
                currString.append(")")
                backtracking(leftCount, rightCount + 1)
                currString.removeLast()
            }
            
        }
        
    }
}

print(Solution().generateParenthesis(4))



