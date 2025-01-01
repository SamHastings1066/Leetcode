// First approach
//class Solution {
//    func findSmallestSetOfVertices(_ n: Int, _ edges: [[Int]]) -> [Int] {
//        /*
//        create graph
//        create inverse graph
//        seen is empty
//        for each node:
//            if node not in seen
//            ans+=1
//            root = traverse inverse graph until you get to the end
//            
//            dfs from root marking every node as seen
//        return ans
//        */
//        var graph = [Int:[Int]]()
//        var inverseGraph = [Int:[Int]]()
//        for edge in edges {
//            let x = edge[0]
//            let y = edge[1]
//            graph[x, default: []].append(y)
//            inverseGraph[y, default: []].append(x)
//        }
//
//        var seen = Set<Int>()
//        var ans = [Int]()
//
//        for node in 0..<n {
//            if !seen.contains(node) {
//                var root = node
//                while let neighs = inverseGraph[root] {
//                    root = neighs[0]
//                }
//                ans.append(root)
//                dfs(root)
//            }
//        }
//        func dfs(_ root: Int) {
//            guard !seen.contains(root) else {return}
//            seen.insert(root)
//            for neigh in graph[root, default:[]] {
//                dfs(neigh)
//            }
//
//        }
//        return ans
//    }
//}

// Better solution: Just return nodes which have an in degree of zero
class Solution {
    func findSmallestSetOfVertices(_ n: Int, _ edges: [[Int]]) -> [Int] {
        var inDegree = Array(repeating:0, count: n)
        for edge in edges {
            inDegree[edge[1]]+=1
        }
        return inDegree.enumerated().compactMap { index, value in
            value == 0 ? index : nil
        }
    }
}
