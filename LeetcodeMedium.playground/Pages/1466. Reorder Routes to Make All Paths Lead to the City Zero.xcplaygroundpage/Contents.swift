// My first solution: Time - O(n), Space - O(n)
/*
 Here, we have a directed graph given as an array of edges. What edges do we need to swap? The problem states that there is only one way to travel between two different cities. We want every city to be able to reach 0, and because there is only one road between cities, all roads must be directed towards 0. This means we can traverse away from 0, and anytime we see that an edge is pointing away from 0, we know we need to swap it.
 */
 
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

        // This dfs is traversing the tree in the opposite direction to that which we actually want to travel. Therefore, any time we use an edge in the original direction we know it is in the wrong direction and must increment ans by 1.
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
