// My first solution: Time - O(n), Space - O(n)
class Solution {
    func minReorder(_ n: Int, _ connections: [[Int]]) -> Int {
        var graph = [Int:[(Int,Bool)]]()
        for edge in connections {
            let x = edge[0]
            let y = edge[1]
            graph[x, default: []].append((y,true)) // Original direction
            graph[y, default: []].append((x,false)) // Reverse direction
        }

        var ans = 0
        var seen:  Set<Int> = []
        dfs(0)
        return ans

        func dfs(_ node: Int) {
            if seen.contains(node) { return }
            seen.insert(node)
            for (neigh, requiresReorientation) in graph[node, default:[]] {
                if !seen.contains(neigh) {
                    if requiresReorientation { ans += 1 } // Increment if this is not in reverse direction because we are traversing from 0 to leaf, whereas we want all traversals to be from leaf to 0!
                    dfs(neigh)
                }
            }
        }

    }
}
