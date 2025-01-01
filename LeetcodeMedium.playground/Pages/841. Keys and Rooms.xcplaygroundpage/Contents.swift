class Solution {
    func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
        var seen = Set<Int>()
        var visited = 0
        dfs(0)
        return visited == rooms.count

        func dfs(_ room: Int) {
            if seen.contains(room) { return }
            seen.insert(room)
            visited += 1
            for neigh in rooms[room] {
                dfs(neigh)
            }
            
        }
    }
}
