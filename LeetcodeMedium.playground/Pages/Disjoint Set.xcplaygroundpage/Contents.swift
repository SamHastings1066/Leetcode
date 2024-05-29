// Quick Find
//class DisjointSet {
//    var root: [Int] = []
//    
//    init(size: Int) {
//        for i in 0..<size {
//            root.append(i)
//        }
//    }
//    
//    func findRoot(_ node: Int) -> Int {
//        return root[node]
//    }
//    
//    func union(_ x: Int, _ y: Int) {
//        var rootX = findRoot(x)
//        var rootY = findRoot(y)
//        if rootX != rootY {
//            for i in root.indices {
//                if root[i] == rootY {
//                    root[i] = rootX
//                }
//            }
//        }
//    }
//    
//    func isConnected(_ x: Int, _ y: Int) -> Bool {
//        return findRoot(x) == findRoot(y)
//    }
//}

// Quick Union
class DisjointSet {
    var parent: [Int] = []
    
    init(size: Int) {
        for i in 0..<size {
            parent.append(i)
        }
    }
    
    func findRoot(_ node: Int) -> Int {
        var node = node
        while node != parent[node] {
            node = parent[node]
        }
        return node
    }
    
    func union(_ x: Int, _ y: Int) {
        var rootX = findRoot(x)
        var rootY = findRoot(y)
        if rootX != rootY {
            parent[rootY] = rootX
        }
    }
    
    func isConnected(_ x: Int, _ y: Int) -> Bool {
        return findRoot(x) == findRoot(y)
    }
}

 Union by Rank
class DisjointSet {
    var parent: [Int] = []
    var rank: [Int] = []
    
    init(size: Int) {
        for i in 0..<size {
            parent.append(i)
            rank.append(1)
        }
    }
    
    func findRoot(_ node: Int) -> Int {
        var node = node
        while node != parent[node] {
            node = parent[node]
        }
        return node
    }
    
    func union(_ x: Int, _ y: Int) {
        var rootX = findRoot(x)
        var rootY = findRoot(y)
        if rootX != rootY {
            if rank[rootY] < rank[rootX]{
                parent[rootY] = rootX
            } else if rank[rootX] < rank[rootY]{
                parent[rootX] = rootY
            } else {
                parent[rootY] = rootX
                rank[rootX] += 1
            }
        }
    }
    
    func isConnected(_ x: Int, _ y: Int) -> Bool {
        return findRoot(x) == findRoot(y)
    }
}

var dSet = DisjointSet(size: 6)

var edges = [[0,1],[1,5],[2,3],[3,4]]

for edge in edges {
    dSet.union(edge[0], edge[1])
    print(dSet.parent)
}



print(dSet.isConnected(0, 5)) // true
print(dSet.isConnected(1, 2)) // false
