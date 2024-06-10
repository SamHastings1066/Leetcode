// First attempt
//class Solution {
//    
//    class Node {
//        var id: Int
//        var neighs: [Int]
//        
//        init(id: Int, neighs: [Int] = []) {
//            self.id = id
//            self.neighs = neighs
//        }
//        
//    }
//    
//    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
//        
//        var graph = [Int:Node]()
//        for i in 0..<numCourses {
//            graph[i] = Node(id: i)
//        }
//        for pre in prerequisites {
//            let id = pre[0], neigh = pre[1]
//            graph[id]!.neighs.append(neigh)
//        }
//        
//        for (index, node) in graph {
//            if node.id > 0 {
//                if BFS(node) ==  false {return false}
//            }
//        }
//        
//        return true
//        
//        func BFS(_ node: Node) -> Bool {
//            node.id = -1
//            var queue = [node]
//            while !queue.isEmpty {
//                var curr = queue.removeLast()
//                for n in curr.neighs {
//                    if graph[n]!.id == -1 { return false }
//                    queue.append(graph[n]!)
//                }
//            }
//            return true
//        }
//        
//    }
//}

// Without inout vars
class Solution {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var visited = Array(repeating: false, count: numCourses)
        var inStack = Array(repeating: false, count: numCourses)
        var adj = Array(repeating: [Int](), count: numCourses)
        for prerequisite in prerequisites {
            adj[prerequisite[0]].append(prerequisite[1])
        }
        for i in 0..<numCourses {
            if visited[i] == false {
                if DFS(i) == true {return false}
            }
        }
        return true
        
        func DFS(_ node: Int) -> Bool {
            if inStack[node] { return true }
            if visited[node] { return false }
            visited[node] = true
            inStack[node] = true
            for n in adj[node] {
                if DFS(n) { return true}
            }
            inStack[node] = false
            return false
        }
    }
}




var numCourses = 5, prerequisites = [[1,4],[2,4],[3,1],[3,2]]


print(Solution().canFinish(numCourses, prerequisites))
