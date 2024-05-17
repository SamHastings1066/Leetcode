class Solution {
    func simplifyPath(_ path: String) -> String {
        var arr = path.split(separator: "/")
        var res = [String]()
        for ele in arr {
            if ele == ".." {
                if res.count > 0 {
                    res.removeLast()
                }
            } else if ele == "." {
                continue
            } else {
                res.append(String(ele))
            }
        }
        return "/" + res.joined(separator: "/")
        
    }
}

var path = "/a/./b/../../c/"

print(Solution().simplifyPath(path))
