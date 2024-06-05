class Solution {
    class Node {
        var id: String
        var neighs: [String: Double]
        init(id: String, neighs: [String : Double] = [:]) {
            self.id = id
            self.neighs = neighs
        }
    }
    
    func calcEquation(_ equations: [[String]], _ values: [Double], _ queries: [[String]]) -> [Double] {
        // Create graph
        var graph = [String: Node]()
        for (index, pair) in equations.enumerated() {
            let a = pair[0], b = pair[1]
            if graph[a] == nil { graph[a] = Node(id: a)}
            if graph[b] == nil { graph[b] = Node(id: b)}
            graph[a]?.neighs[b] = values[index]
            graph[b]?.neighs[a] = 1/values[index]
        }
        
        var ans = [Double]()
        
        for q in queries {
            let c = q[0], d = q[1]
            if graph[c] == nil || graph[d] == nil { ans.append(-1); continue }
            if c == d { ans.append(1); continue }
            var visited: [String] = []
            if let res = DFS(c,d,&visited) {
                ans.append(res)
            } else {
                ans.append(-1)
            }
            
            
            
        }
        
        return ans
        
        func DFS(_ c: String, _ d: String, _ visited: inout [String]) -> Double? {
            visited.append(c)
            if let val = graph[c]?.neighs[d] { return val}
            for (neighbor, value) in graph[c]!.neighs {
                if !visited.contains(neighbor) {
                    if let res = DFS(neighbor, d, &visited) {
                        return res * value
                    }
                }
            }
            return nil
        }
    }
}


var equations = [["x1","x2"],["x2","x3"],["x3","x4"],["x4","x5"]], values = [3.0,4.0,5.0,6.0], queries = [["x1","x5"],["x5","x2"],["x2","x4"],["x2","x2"],["x2","x9"],["x9","x9"]]

print(Solution().calcEquation(equations, values, queries))
