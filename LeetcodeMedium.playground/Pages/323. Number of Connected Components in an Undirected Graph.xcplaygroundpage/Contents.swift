class Solution {
    func countComponents(_ n: Int, _ edges: [[Int]]) -> Int {
        var ans = 0
        var graph = [Int:[Int]]()
        for edge in edges {
            let u = edge[0]
            let v = edge[1]
            graph[u, default:[]].append(v)
            graph[v, default:[]].append(u)
        }
        var seen = Array(repeating: false, count: n)
        for node in 0..<n {
            if !seen[node] {
                ans += 1
                dfs(node)
            }
        }
        return ans

        func dfs(_ node: Int) {
            seen[node] = true
            for neigh in graph[node, default:[]] {
                if !seen[neigh] {
                    dfs(neigh)
                }
            }
        }
    }
}
