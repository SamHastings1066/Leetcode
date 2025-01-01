// Time: O(V + E); Space: O(V + E)
class Solution {
    func reachableNodes(_ n: Int, _ edges: [[Int]], _ restricted: [Int]) -> Int {
        var graph = [Int:[Int]]()
        var seen = Array(repeating: false, count: n)
        let restricted = Set(restricted)

        for edge in edges{
            let x = edge[0]
            let y = edge[1]
            graph[x, default:[]].append(y)
            graph[y, default:[]].append(x)
        }

        var ans = 0
        dfs(0)
        return ans

        func dfs(_ node: Int) {
            seen[node] = true
            ans += 1
            for neigh in graph[node, default:[]] {
                if !seen[neigh] && !restricted.contains(neigh) {
                    dfs(neigh)
                }
            }
        }
    }
}
