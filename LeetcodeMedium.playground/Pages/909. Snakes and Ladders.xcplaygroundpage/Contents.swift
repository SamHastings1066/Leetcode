class Solution {
    func snakesAndLadders(_ board: [[Int]]) -> Int {
        let n = board.count
        
        // 1. Create an array `cells` which stores the (row, column) tuple (i.e. the board cell) whose label corresponds to the specific index in the array. The board is labelled in a Boustrophedon style - i.e. alternating direction each row. The first cell on the board (the bottom left cell) i labelled '1'.
        var cells = Array(repeating: (0,0), count: n * n + 1)
        var label = 1
        var columns = Array(0..<n)
        for row in stride(from: n-1, through: 0, by: -1) {
            for column in columns {
                cells[label] = (row, column)
                label += 1
            }
            columns.reverse()
        }
        
        // 2. Create a `queue` to hold cell labels in order to BFS traverse the board; push the label of the first cell onto the queue. Create an array `dist` to store the number of moves required to travel from the first cell in the board to the cell whose label corresponds to the index of the element in `dist`. Initialise all cells as initially unreachable from the first cell using a value of `-1`.
        var queue = [1]
        var dist = Array(repeating: -1, count: n * n + 1)
        dist[1] = 0 // The distance from the first cell to itself is 0
        
        // 3. While queue is not empty:
        // - pop a cell label from the queue and denote it `curr`. For each cell (row, column) with label `next` in the range curr+1 to min(curr + 6, n*n), if that cell has a snake or ladder (i.e. board[row][column] != -1) set `destination` to the label of the snake/ladder destination cell, else set it to next.
        // - if dist[destination] == -1 (i.e. the destination has not been visited yet) then set its value to destination[curr] + 1 - the number of moves to get to curr, plus an extra move to get to destination. If the destination has already been visited then do not update it's value - its value already holds the minimum number of moves required to reach that destination.
        while !queue.isEmpty {
            var curr = queue.removeFirst()
            
            for next in curr + 1..<min(curr + 6, n*n) + 1 {
                let (row, column) = cells[next]
                var destination = board[row][column] != -1 ? board[row][column] : next
                if dist[destination] == -1 {
                    dist[destination] = dist[curr] + 1
                    queue.append(destination)
                }
            }
        }
        // 4. Return the number of moves to get to cell labelled n*n. If this cell is unreachable dist[n*n] will still return its initial value of -1.
        return dist[n*n]
    }
}

let board = [[-1,-1,-1,-1,-1,-1],[-1,-1,-1,-1,-1,-1],[-1,-1,-1,-1,-1,-1],[-1,35,-1,-1,13,-1],[-1,-1,-1,-1,-1,-1],[-1,15,-1,-1,-1,-1]]

print(Solution().snakesAndLadders(board))
