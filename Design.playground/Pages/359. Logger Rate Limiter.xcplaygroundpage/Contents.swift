
class Logger {
    
    // maps a message string to the last timestamp at which is was printed
    var dict: [String:Int]

    init() {
        dict = [:]
    }
    
    func shouldPrintMessage(_ timestamp: Int, _ message: String) -> Bool {
        if let lastTimePrinted = dict[message] {
            if lastTimePrinted <= timestamp - 10 {
                dict[message] = timestamp
                return true
            } else {
                // messags is in dict, but last printed less than 10s ago
                return false
            }
        } else {
            dict[message] = timestamp
            return true
        }
    }
}

/**
 * Your Logger object will be instantiated and called as such:
 * let obj = Logger()
 * let ret_1: Bool = obj.shouldPrintMessage(timestamp, message)
 */
