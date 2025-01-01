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

func createHashMapGraph(from edges: [[Int]]) -> [Int:[Int]] {
    var graph = [Int:[Int]]()
    for (edge) in edges {
        let x = edge[0]
        let y = edge[1]
        graph[x, default:[]].append(y)
        graph[y, default:[]].append(x) // comment out this line if graph is directed
    }
    return graph
}

var edges = [[0, 1], [1, 2], [2, 0], [2, 3]]

let hashGraph = createHashMapGraph(from: edges)
print(hashGraph)

var headNode = createConnectedGraph(edges)

for neighbor in headNode.neighbors {
    if let neighbor {
        print(neighbor.val)
    }
}
