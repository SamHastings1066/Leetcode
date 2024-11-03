class RateLimiter {

    let n: Int
    let t: Int
    var requestQueue = [Int]()
    
    init(_ n: Int, _ t: Int) {
        self.n = n
        self.t = t
    }
    
    func shouldAllow(_ timestamp: Int) -> Bool {
        for request in requestQueue {
            if request < timestamp - t {
                requestQueue.removeFirst()
            }
        }
        if requestQueue.count < n {
            requestQueue.append(timestamp)
            return true
        }
        return false
    }
}
