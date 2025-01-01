// Time: O(n+m); Space: O(n+m) - where n is number of nodes; m is number of edges.
class Solution {
    func validPath(_ n: Int, _ edges: [[Int]], _ source: Int, _ destination: Int) -> Bool {
        var graph = [Int:[Int]]()
        for edge in edges {
            let u = edge[0]
            let v = edge[1]
            graph[u, default:[]].append(v)
            graph[v, default:[]].append(u)
        }
        var seen = Array(repeating: false, count: n)
        return dfs(source)

        func dfs(_ source: Int) -> Bool {
            if source == destination { return true }
            seen[source] = true
            for neigh in graph[source, default: []] {
                if !seen[neigh] {
                    if dfs(neigh) {return true}
                }
            }
            return false
        }
    }
}
