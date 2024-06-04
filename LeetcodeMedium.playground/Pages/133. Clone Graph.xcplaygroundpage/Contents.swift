class Node {
    public var val: Int
    public var neighbors: [Node?]
    public init(_ val: Int) {
        self.val = val
        self.neighbors = []
    }
}

func createConnectedGraph(_ edges: [[Int]]) -> Node {
    var newNodes = [Node]()
    for i in 1...edges.count {
        var newNode = Node(i)
        newNodes.append(newNode)
    }
    
    for i in newNodes.indices {
        for edge in edges[i] {
            newNodes[i].neighbors.append(newNodes[edge-1])
        }
    }
    return newNodes[0]
}


// DFS using recursion
//class Solution {
//    var visited = [Int:Node]()
//    func cloneGraph(_ node: Node?) -> Node? {
//        if let node {
//            let value = node.val
//            if let clonedNode = visited[value] {
//                    return clonedNode
//                }
//            var clonedNode = Node(value)
//            visited[node.val] = clonedNode
//            for neighbor in node.neighbors {
//                clonedNode.neighbors.append(cloneGraph(neighbor))
//            }
//            return clonedNode
//        } else {
//            return nil
//        }
//        
//    }
//}

// DFS using explicit stack - notice exatcly th same as BFS, except remove from the end of the stack and not from the begining of the queue
class Solution {
    
    func cloneGraph(_ node: Node?) -> Node? {
        if let node {
            var visited = [node.val: Node(node.val)]
            var stack = [node]
            while !stack.isEmpty {
                let curr = stack.removeLast()
                for n in curr.neighbors {
                    if visited[n!.val] == nil {
                        visited[n!.val] = Node(n!.val)
                        stack.append(n!)
                    }
                    visited[curr.val]?.neighbors.append(visited[n!.val])
                }
            }
            return visited[node.val]
        } else {
            return nil
        }
    }
}

// BFS
//class Solution {
//    
//    func cloneGraph(_ node: Node?) -> Node? {
//        if let node {
//            var visited = [node.val: Node(node.val)]
//            var queue = [node]
//            while !queue.isEmpty {
//                let curr = queue.removeFirst()
//                for n in curr.neighbors {
//                    if visited[n!.val] == nil {
//                        visited[n!.val] = Node(n!.val)
//                        queue.append(n!)
//                    }
//                    visited[curr.val]?.neighbors.append(visited[n!.val])
//                }
//            }
//            return visited[node.val]
//        } else {
//            return nil
//        }
//        
//    }
//}

var edges = [[2,4],[1,3],[2,4],[1,3]]

var headNode = createConnectedGraph(edges)

var clonedHead = Solution().cloneGraph(headNode)

if let clonedHead {
    for neighbor in clonedHead.neighbors {
        if let neighbor {
            print(neighbor.val)
        }
    }
} else {
    print("no clonehead")
}
