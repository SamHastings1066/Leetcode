
class Node {
    var value: String
    var children: [Node] = []
    
    init(value: String) {
        self.value = value
    }
    
    func add(child: Node) {
        children.append(child)
    }
}

extension Node: CustomStringConvertible {
    var description: String {
        var text = "\(value)"
        
        if !children.isEmpty {
            text += ": { " + children.map { $0.description }.joined(separator: ", ") + " }"
        }
        return text
    }
}

let beverage = Node(value: "beverage")
let coke = Node(value: "coke")
let pepsi = Node(value: "pepsi")

beverage.add(child: coke)
beverage.add(child: pepsi)


print(beverage)
