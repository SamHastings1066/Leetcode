//class Solution {
//    class Node {
//        var id: String
//        var neighs: [String: Double]
//        init(id: String, neighs: [String : Double] = [:]) {
//            self.id = id
//            self.neighs = neighs
//        }
//    }
//    
//    func calcEquation(_ equations: [[String]], _ values: [Double], _ queries: [[String]]) -> [Double] {
//        // Create graph
//        var graph = [String: Node]()
//        for (index, pair) in equations.enumerated() {
//            let a = pair[0], b = pair[1]
//            if graph[a] == nil { graph[a] = Node(id: a)}
//            if graph[b] == nil { graph[b] = Node(id: b)}
//            graph[a]?.neighs[b] = values[index]
//            graph[b]?.neighs[a] = 1/values[index]
//        }
//        
//        var ans = [Double]()
//        
//        for q in queries {
//            let c = q[0], d = q[1]
//            if graph[c] == nil || graph[d] == nil { ans.append(-1); continue }
//            if c == d { ans.append(1); continue }
//            var visited: [String] = []
//            if let res = DFS(c,d,&visited) {
//                ans.append(res)
//            } else {
//                ans.append(-1)
//            }
//            
//            
//            
//        }
//        
//        return ans
//        
//        func DFS(_ c: String, _ d: String, _ visited: inout [String]) -> Double? {
//            visited.append(c)
//            if let val = graph[c]?.neighs[d] { return val}
//            for (neighbor, value) in graph[c]!.neighs {
//                if !visited.contains(neighbor) {
//                    if let res = DFS(neighbor, d, &visited) {
//                        return res * value
//                    }
//                }
//            }
//            return nil
//        }
//    }
//}

//class Solution {
//    class Node {
//        let id: String
//        var neighs = [String: Double]()
//        init(id: String) {
//            self.id = id
//        }
//    }
//    
//    var ans = [Double]()
//    var visited: [String] = []
//    
//    func makeGraph(_ equations: [[String]], _ values: [Double]) -> [String: Node] {
//        var graph = [String: Node]()
//        for (i, equation) in equations.enumerated() {
//            let a = equation[0]
//            let b = equation[1]
//            if graph[a] == nil { graph[a] = Node(id: a) }
//            if graph[b] == nil { graph[b] = Node(id: b) }
//            graph[a]?.neighs[b] = values[i]
//            graph[b]?.neighs[a] = 1.0 / values[i]
//        }
//         return graph
//    }
//    
//    
//    
//    func calcEquation(_ equations: [[String]], _ values: [Double], _ queries: [[String]]) -> [Double] {
//        
//        func computeResult(c: String, d: String) -> Double {
//            visited = []
//            if let res = DFS(c, d) { return res }
//            return -1.0
//        }
//        
//        func DFS(_ c: String, _ d: String) -> Double? {
//            visited.append(c)
//            if graph[c] == nil { return nil }
//            if c == d { return 1.0 }
//            for (neighbor, value) in graph[c]!.neighs {
//                if !visited.contains(neighbor) {
//                    if let res = DFS(neighbor, d) {
//                        return res * value
//                    }
//                }
//            }
//            return nil
//        }
//        
//        let graph = makeGraph(equations, values)
//        for query in queries {
//            ans.append(computeResult(c: query[0], d: query[1]))
//        }
//        return ans
//    }
//    
//}

class Solution {
    var visited: [String] = []
    func calcEquation(_ equations: [[String]], _ values: [Double], _ queries: [[String]]) -> [Double] {
        // Step 1: Build the graph
        let graph = buildGraph(equations, values)
        
        // Step 2: Process each query
        return queries.map { evaluateQuery($0, in: graph) }
    }
    
    /// Builds a graph where variables are nodes and edges represent division relationships
    private func buildGraph(_ equations: [[String]], _ values: [Double]) -> [String: [String: Double]] {
        var graph = [String: [String: Double]]()
        
        for (i, equation) in equations.enumerated() {
            let a = equation[0]
            let b = equation[1]
            let value = values[i]
            
//            if graph[a] == nil { graph[a] = [:]}
//            if graph[b] == nil { graph[b] = [:]}
//            graph[a]![b] = value
//            graph[b]![a] = 1.0 / value
            
            // More swifty syntax for above
            graph[a, default: [:]][b] = value          // a / b = value
            graph[b, default: [:]][a] = 1.0 / value    // b / a = 1 / value
        }
        
        return graph
    }
    
    /// Evaluates a single query by performing a DFS on the graph
    private func evaluateQuery(_ query: [String], in graph: [String: [String: Double]]) -> Double {
        let c = query[0]
        let d = query[1]
        
        guard graph[c] != nil, graph[d] != nil else {
            return -1.0 // One or both variables are undefined
        }
        
        visited = []
        return dfs(c, d, graph) ?? -1.0
    }
    
    /// Performs a DFS to find the path between two nodes and calculate the product of edge weights
    private func dfs(
        _ c: String,
        _ d: String,
        _ graph: [String: [String: Double]]
    ) -> Double? {
        // Base cases
        if c == d {
            return 1.0 // Found the target node
        }
        
        visited.append(c)
        
//        if let neighbours = graph[c] {
//            for (neighbour, weight) in neighbours {
//                if !visited.contains(neighbour) {
//                    if let res = dfs(neighbour, d, graph){
//                        return weight * res
//                    }
//                }
//            }
//        }
        
        // More Swifty way to do above.
        for (neighbor, weight) in graph[c, default: [:]] {
            if !visited.contains(neighbor) {
                if let result = dfs(neighbor, d, graph) {
                    return result * weight
                }
            }
        }
        
        return nil
    }
}


var equations = [["x1","x2"],["x2","x3"],["x3","x4"],["x4","x5"]], values = [3.0,4.0,5.0,6.0], queries = [["x1","x5"],["x5","x2"],["x2","x4"],["x2","x2"],["x2","x9"],["x9","x9"]]

print(Solution().calcEquation(equations, values, queries))
