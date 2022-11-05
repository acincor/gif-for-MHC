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
print("请输入你的python版本:(SHORT VERSION，如3.11，必须是python3.5及以上，或python2.7，请输对版本！)")
var ReadLine = readLine()!
guard let double = Double(ReadLine) else {
    print("输入错误")
    exit(-1023)
}
if double > 3.5 || double == 2.7 {
    var FileContents = """
    #!/Library/Frameworks/Python.framework/Versions/\(ReadLine)/bin/python\(ReadLine)
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
        #!/Library/Frameworks/Python.framework/Versions/\(ReadLine)/bin/python\(ReadLine)
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
} else {
    print("版本过小，退出！")
    exit(-1023)
}
