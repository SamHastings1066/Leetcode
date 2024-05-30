func dummy(grid: [[Int]]) {
    let height = grid.count
    let width = grid[0].count
    
    print("\(height) x \(width)")
}

func printGridStats(grid: [[Int]], dimensionsPrinter:([[Int]]) -> Void ) {
    print(grid)
    dimensionsPrinter(grid)
}

var grid = [[1,2,3], [4,5,6]]

printGridStats(grid: grid) { _ in
    dummy(grid: grid)
}

func addToGrid(grid: [[Int]], gridFunc: (_ digit: Int) -> Int) -> [Int]{
    var result = [Int]()
    for i in 0..<grid.count {
        for j in 0..<grid[0].count {
            let temp = grid[i][j] + 1
            result.append(gridFunc(temp))
        }
    }
    return result
}
func gridFunc(digit: Int) -> Int {
    return digit + 4
}

var shiftedArr = addToGrid(grid: grid) { digit in
    gridFunc(digit: digit)
}
print(shiftedArr)


