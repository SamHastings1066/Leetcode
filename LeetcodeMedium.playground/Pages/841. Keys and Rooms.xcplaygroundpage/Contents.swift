// First implementation
//class Solution {
//    func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
//        var seen = Set<Int>()
//        var visited = 0
//        dfs(0)
//        return visited == rooms.count
//
//        func dfs(_ room: Int) {
//            if seen.contains(room) { return }
//            seen.insert(room)
//            visited += 1
//            for neigh in rooms[room] {
//                dfs(neigh)
//            }
//            
//        }
//    }
//}

// Slicker implementation - only do dfs if neigh not in seen; don't use visited, just check is seen is the same size as rooms,
class Solution {
    func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
        var seen = Set<Int>()
        seen.insert(0)
        dfs(0)
        return seen.count == rooms.count

        func dfs(_ room: Int) {
            seen.insert(room)
            for neigh in rooms[room] {
                if !seen.contains(neigh) {
                    dfs(neigh)
                }
            }
            
        }
    }
}
