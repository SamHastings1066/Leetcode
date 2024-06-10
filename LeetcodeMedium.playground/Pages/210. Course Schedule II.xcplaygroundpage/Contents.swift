class Solution {
    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        var adj = Array(repeating: [Int](), count: numCourses)
        var inDegree = Array(repeating: 0, count: numCourses)
        for r in prerequisites {
            adj[r[1]].append(r[0])
            inDegree[r[0]] += 1
        }
        var q = [Int]()
        for (idx, count) in inDegree.enumerated() {
            if count == 0 { q.append(idx)}
        }
        var taken = [Int]()
        while !q.isEmpty {
            var curr = q.removeFirst()
            if !taken.contains(curr) { taken.append(curr)}
            for pre in adj[curr] {
                inDegree[pre] -= 1
                if inDegree[pre] == 0 { q.append(pre)}
            }
        }
        if taken.count != numCourses {return []}
        return taken
    }
}


var numCourses = 3, prerequisites = [[1,0],[1,2],[0,1]]

print(Solution().findOrder(numCourses, prerequisites))
