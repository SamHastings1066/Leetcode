
// First implementation
//class LogAggregator {
//    
//    let machines: Int
//    let services: Int
//    
//    struct Log {
//        let logId: Int
//        let machineId: Int
//        let serviceId: Int
//        let message: String
//    }
//    
//    var logQueue: [Log] = []
//
//    init(_ machines: Int, _ services: Int) {
//        self.machines = machines
//        self.services = services
//    }
//    
//    func pushLog(_ logId: Int, _ machineId: Int, _ serviceId: Int, _ message: String) {
//        let log = Log(logId: logId, machineId: machineId, serviceId: serviceId, message: message)
//        logQueue.append(log)
//    }
//    
//    func getLogsFromMachine(_ machineId: Int) -> [Int] {
//        var result = [Int]()
//        for log in logQueue {
//            if log.machineId == machineId {
//                result.append(log.logId)
//            }
//        }
//        return result
//    }
//    
//    func getLogsOfService(_ serviceId: Int) -> [Int] {
//        var result = [Int]()
//        for log in logQueue {
//            if log.serviceId == serviceId {
//                result.append(log.logId)
//            }
//        }
//        return result
//    }
//    
//    func search(_ serviceId: Int, _ searchString: String) -> [String] {
//        var result = [String]()
//        for log in logQueue {
//            if log.serviceId == serviceId && log.message.contains(searchString) {
//                result.append(log.message)
//            }
//        }
//        return result
//    }
//}

// Model solution:

class LogAggregator {
    
    let machines: Int
    let services: Int
    var logs = [Int:String]() // LogId -> message
    var logsForMachine = [Int:[Int]]() // MachineId -> LogId
    var logsForService = [Int:[Int]]() // ServiceId -> LogId


    init(_ machines: Int, _ services: Int) {
        self.machines = machines
        self.services = services
    }
    
    func pushLog(_ logId: Int, _ machineId: Int, _ serviceId: Int, _ message: String) {
        logs[logId] = message
        logsForMachine[machineId, default: []].append(logId)
        logsForService[serviceId, default: []].append(logId)
        
    }
    
    func getLogsFromMachine(_ machineId: Int) -> [Int] {
        logsForMachine[machineId, default: []]
    }
    
    func getLogsOfService(_ serviceId: Int) -> [Int] {
        logsForService[serviceId, default: []]
    }
    
    func search(_ serviceId: Int, _ searchString: String) -> [String] {
        var results = [String]()
        let filteredLogs = logsForService[serviceId, default: []]
        for log in filteredLogs {
            if logs[log, default: ""].contains(searchString) {
                results.append(logs[log, default: ""])
            }
        }
        return results
    }
}


let obj = LogAggregator(3, 3)
obj.pushLog(2322, 1, 1, "Machine 1 Service 1 Log 1")
obj.pushLog(2312, 1, 1, "Machine 1 Service 1 Log 2")
obj.pushLog(2352, 1, 1, "Machine 1 Service 1 Log 3")
obj.pushLog(2298, 1, 1, "Machine 1 Service 1 Log 4")
obj.pushLog(23221, 1, 2, "Machine 1 Service 2 Log 1")
obj.pushLog(23121, 1, 2, "Machine 1 Service 2 Log 2")
obj.pushLog(23222, 2, 2, "Machine 2 Service 2 Log 1")
obj.pushLog(23122, 2, 2, "Machine 2 Service 2 Log 2")
obj.pushLog(23521, 1, 2, "Machine 1 Service 2 Log 3")
obj.pushLog(22981, 1, 2, "Machine 1 Service 2 Log 4")
obj.pushLog(23522, 2, 2, "Machine 2 Service 2 Log 3")
obj.pushLog(22982, 2, 2, "Machine 2 Service 2 Log 4")
let ret_2: [Int] = obj.getLogsFromMachine(2)
let ret_3: [Int] = obj.getLogsOfService(2)
let ret_4: [String] = obj.search(1, "Log 1")
let ret_5: [String] = obj.search(2, "Log 3")

