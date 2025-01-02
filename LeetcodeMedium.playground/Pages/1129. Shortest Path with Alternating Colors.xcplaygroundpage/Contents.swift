class Solution {
    func shortestAlternatingPaths(_ n: Int, _ redEdges: [[Int]], _ blueEdges: [[Int]]) -> [Int] {

        var ans = Array(repeating: -1, count: n)
        ans[0] = 0
        var graph = [Int:[[Int]]]()

        for edge in redEdges{
            let a = edge[0]
            let b = edge[1]
            graph[a, default:[]].append([b,0]) // 0 signifies red edge
        }
        for edge in blueEdges{
            let a = edge[0]
            let b = edge[1]
            graph[a, default:[]].append([b,1]) // 1 signifies blue edge
        }

        var seen = Array(repeating:[false, false], count: n)
        

        var queue = [[0,0,-1]] // [node, level, prevColor - -1 means neither red not blue]
        // set node zero to have been already visited from red and bleu edges so that it is not visited again
        seen[0][0] = true
        seen[0][1] = true
        while !queue.isEmpty {
            let cell = queue.removeFirst()
            let node = cell[0]
            let level = cell[1]
            let prevColor = cell[2]
            if let neighs = graph[node]{
                for neigh in neighs {
                    let nextNode = neigh[0]
                    let color = neigh[1]
                    if !seen[nextNode][color], color != prevColor  {
                        if ans[nextNode] == -1 {
                            ans[nextNode] = level + 1
                        }
                        seen[nextNode][color] = true
                        queue.append([nextNode, level + 1, color])
                    }
                }
            }

        }
        return ans
         
    }
}
