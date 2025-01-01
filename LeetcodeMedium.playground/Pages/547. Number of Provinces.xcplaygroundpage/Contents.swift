
// Solution using input directly
//class Solution {
//    func findCircleNum(_ isConnected: [[Int]]) -> Int {
//        var seen = Set<Int>()
//        var ans = 0
//
//        for x in isConnected.indices {
//            if !seen.contains(x){
//                ans += 1
//                dfs(x)
//            }
//        }
//        return ans
//
//        func dfs(_ x: Int) {
//            if seen.contains(x) { return }
//            seen.insert(x)
//            for y in isConnected[x].indices {
//                if isConnected[x][y] == 1 {
//                    dfs(y)
//                }
//            }
//        }
//
//    }
//}

// Solution building your own graph
class Solution {
    func findCircleNum(_ isConnected: [[Int]]) -> Int {
        var seen = Set<Int>()
        var ans = 0

        var graph = [Int:[Int]]()
        let n = isConnected.count
        for i in 0..<n {
            for j in i+1..<n {
                if isConnected[i][j] == 1 {
                    graph[i, default:[]].append(j)
                    graph[j, default:[]].append(i)
                }
            }
        }

        for node in isConnected.indices {
            if !seen.contains(node){
                ans += 1
                dfs(node)
            }
        }
        return ans

        func dfs(_ node: Int) {
            if seen.contains(node) { return }
            seen.insert(node)
            for neigh in graph[node, default:[]] {
                dfs(neigh)
            }
        }

    }
}

let isConnected = [[1,0,0],[0,1,0],[0,0,1]]
print(Solution().findCircleNum(isConnected))
