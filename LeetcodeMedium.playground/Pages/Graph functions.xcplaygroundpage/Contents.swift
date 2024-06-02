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

var edges = [[2,4],[1,3],[2,4],[1,3]]

var headNode = createConnectedGraph(edges)

for neighbor in headNode.neighbors {
    if let neighbor {
        print(neighbor.val)
    }
}
