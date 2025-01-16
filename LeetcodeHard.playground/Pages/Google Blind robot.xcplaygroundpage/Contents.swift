
class Solution {
    func findMovesToEnd(grid: [[Character]], end: [Int]) -> [Character] {
        let m = grid.count
        let n = grid[0].count
        let directions: [(Int, Int, Character, Character)] = [
            (1, 0, "D", "U"), // Move down spacially
            (-1, 0, "U", "D"),  // Move up
            (0, -1, "L", "R"), // Move left
            (0, 1, "R", "L")   // Move right
        ]
        
        // Step 1: BFS to compute moves to "E" for each cell
        var movesToEnd = [String: [Character]]()
        var queue = [end]
        movesToEnd["\(end[0]),\(end[1])"] = [] // No moves required for the end itself
        
        while !queue.isEmpty {
            let current = queue.removeFirst()
            let currRow = current[0]
            let currCol = current[1]
            let currentKey = "\(currRow),\(currCol)"
            
            for (dr, dc, move, inverseMove) in directions {
                let nr = currRow + dr
                let nc = currCol + dc
                let nextKey = "\(nr),\(nc)"
                
                if nr >= 0, nr < m, nc >= 0, nc < n,
                   grid[nr][nc] == ".", // Only consider open spaces
                   movesToEnd[nextKey] == nil { // Not visited yet
                    movesToEnd[nextKey] = [inverseMove] + (movesToEnd[currentKey] ?? [])
                    queue.append([nr, nc])
                }
            }
        }
        
        print(movesToEnd)
        
        // Step 2: Simulate moves for all starting points
        var startingPoints = Set<[Int]>()
        for row in 0..<m {
            for col in 0..<n {
                if grid[row][col] == "." {
                    startingPoints.insert([row, col])
                }
            }
        }
        
        print(startingPoints)
        
        var sequenceOfMoves = [Character]()
        
        while !startingPoints.isEmpty {
            // Find moves for the first starting point
            let currentStart = startingPoints.removeFirst()
            //print(currentStart)
            let row = currentStart[0]
            let col = currentStart[1]
            let startKey = "\(row),\(col)"
            let moves = movesToEnd[startKey] ?? []
            print(moves)
            
            // Apply moves to all remaining starting points
            for move in moves {
                sequenceOfMoves.append(move)
                
                var nr = row
                var nc = col
                    
                if move == "U" { nr -= 1 }
                else if move == "D" { nr += 1 }
                else if move == "L" { nc -= 1 }
                else if move == "R" { nc += 1 }
                    if nr >= 0, nr < m, nc >= 0, nc < n, grid[nr][nc] == "." {
                        startingPoints.remove([nr,nc])
                        print([nr,nc])
                }
                
            }
        }
        
        return sequenceOfMoves
    }
}


let grid: [[Character]] = [
    ["#","#","#","#","#"],
    ["#","#","E","#","."],
    [".",".",".",".","."],
    ["#","#","#","#","#"]
]

print(Solution().findMovesToEnd(grid: grid, end: [1,2]))


