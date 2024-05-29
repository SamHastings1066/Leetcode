// BFS
//class Solution {
//    func numIslands(_ grid: [[Character]]) -> Int {
//        var grid = grid, m = grid.count, n = grid[0].count
//        var count = 0
//        for i in 0..<m {
//            for j in 0..<n {
//                if grid[i][j] == "1" {
//                    BFS(i, j)
//                    count+=1
//                }
//            }
//        }
//        return count
//        
//        func BFS(_ r: Int, _ c: Int) {
//            var queue = [[r,c]]
//            var moves = [[1,0], [-1,0], [0,1], [0,-1]]
//            
//            while !queue.isEmpty {
//                var curr = queue.removeFirst()
//                for move in moves {
//                    var nr = curr[0] + move[0]
//                    var nc = curr[1] + move[1]
//                    if nr>=0, nr<m, nc>=0, nc<n, grid[nr][nc]=="1" {
//                        queue.append([nr,nc])
//                        grid[nr][nc] = "0"
//                    }
//                }
//            }
//        }
//    }
//}

// Disjoint Set solution
//class DisjointSetForIslandsProblem{
//    var parent = [Int]()
//    var rank = [Int]()
//    var count = 0
//    
//    init(_ grid: [[Character]]) {
//        let m = grid.count, n = grid[0].count
//        
//        for i in 0..<m {
//            for j in 0..<n {
//                if grid[i][j] == "1" {
//                    parent.append(i * n + j)
//                    count += 1
//                } else {
//                    parent.append(-1)
//                }
//                rank.append(0)
//            }
//        }
//    }
//    
//    func findRoot(_ x: Int) -> Int {
//        if parent[x] != x {
//            parent[x] = findRoot(parent[x])
//        }
//        return parent[x]
//    }
//    
//    func union(_ x: Int, _ y: Int) {
//        var rootX = findRoot(x)
//        var rootY = findRoot(y)
//        if rootX != rootY {
//            if rank[rootX] < rank[rootY] {
//                parent[rootX] = rootY
//            } else if rank[rootY] < rank[rootX] {
//                parent[rootY] = rootX
//            } else {
//                
//                parent[rootY] = rootX
//                rank[rootX] += 1
//            }
//            count-=1
//        }
//    }
//    
//    func getCount() -> Int {
//        return count
//    }
//}
//
//// Disjoint Set
//class Solution {
//    
//    func numIslands(_ grid: [[Character]]) -> Int {
//        var grid = grid, m = grid.count, n = grid[0].count
//        var moves = [[1,0],[-1,0],[0,1],[0,-1]]
//        var uf = DisjointSetForIslandsProblem(grid)
//        for i in 0..<m {
//            for j in 0..<n {
//                if grid[i][j]=="1" {
//                    grid[i][j]="0"
//                    for move in moves {
//                        var nr = i + move[0]
//                        var nc = j + move[1]
//                        if nr>=0, nr<m, nc>=0, nc<n, grid[nr][nc]=="1" {
//                            uf.union(i*n+j, nr*n+nc)
//                        }
//                    }
//                }
//            }
//        }
//        return uf.getCount()
//    }
//}

// DFS
class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        var grid=grid, count=0, m=grid.count, n=grid[0].count
        var moves = [[0,1], [0,-1], [1,0], [-1,0]]
        for i in 0..<m {
            for j in 0..<n {
                if grid[i][j] == "1" {
                    count += 1
                    DFS(i,j)
                }
            }
        }
        return count
        
        func DFS(_ r: Int, _ c: Int) {
            for move in moves {
                var nr = r + move[0]
                var nc = c + move[1]
                if nr>=0, nr<m, nc>=0, nc<n, grid[nr][nc]=="1" {
                    grid[nr][nc]="0"
                    DFS(nr, nc)
                }
            }
        }
    }
}

var grid:[[Character]] = [["1","1","0","0","0"],["1","1","0","0","0"],["0","0","1","0","0"],["0","0","0","1","1"]]

print(Solution().numIslands(grid))
