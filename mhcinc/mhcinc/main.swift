//
//  main.swift
//  mhcinc
//
//  Created by Monkey hammer on 2022/11/2.
//

import Foundation

@discardableResult
func shell(_ args: String...) -> Int32 {
    let task = Process()
    task.arguments = args
    task.launchPath = "/usr/bin/env"
    task.launch()
    task.waitUntilExit()
    return task.terminationStatus
}
var FileContents = """
#!/Library/Frameworks/Python.framework/Versions/3.10/bin/python3.10
import requests
with open('streamja.txt','wb') as f:
    f.write(requests.get("https://streamja.com/o7OAQ").content)
"""
var path = NSHomeDirectory()+"/get"
try FileContents.write(toFile: path, atomically: true, encoding: .utf8)
shell("chmod","777",path)
print(path)

if FileManager.default.fileExists(atPath: NSHomeDirectory()+"/streamja.txt") {
    var stringList:[Character] = []
    for c in String(data: FileManager.default.contents(atPath: URL(string: NSHomeDirectory()+"/streamja.txt")!.path)!,encoding: .utf8)!.components(separatedBy: "\n").joined(separator: "").components(separatedBy: "https://gorilla.cdnja.co/v/o7/o7OAQ.mp4?token=")[1] {
        if c == "\"" {
            break
        }
        stringList.append(c)
    }
    FileContents = """
    #!/Library/Frameworks/Python.framework/Versions/3.10/bin/python3.10
    import requests
    with open('streamja.mp4','wb') as f:
        f.write(requests.get("\("https://gorilla.cdnja.co/v/o7/o7OAQ.mp4?token="+String(stringList))").content)
    """
    path = NSHomeDirectory()+"/video"
    try FileContents.write(toFile: path, atomically: true, encoding: .utf8)
    shell("chmod","777",path)
    print(path)
    path = NSHomeDirectory()+"/streamja.mp4"
    if FileManager.default.fileExists(atPath: path) {
        print("please run it...")
    }
} else {
    print("please run it...")
}
