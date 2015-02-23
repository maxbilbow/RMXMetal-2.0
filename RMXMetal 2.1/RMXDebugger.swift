//
//  RMXDebugger.swift
//  OC to Swift oGL
//
//  Created by Max Bilbow on 16/02/2015.
//  Copyright (c) 2015 Rattle Media Ltd. All rights reserved.
//


//import SceneKit
//protocol RMXTestable {
//    //func debugger: RMXDebugger {get}
//    var label: String {get set}
//    mutating func debug(message: String)
//    //class func debug(key: String, message: String)
//    
//}
public struct RMX  {
    static var tog = 0
    static var lastCheck = ""
    static var logs: [String] = Array<String>()
    //bool * print = new bool[10];
    
    static var checks: [ String: String ] = [ "ERROR":"N/A", "Debug":"N/A"]
    static var monitor: [ String ] = [ "ERROR" , "Debug" ]
    static var isDebugging = true
    //GLKVector2 win = new GLKVector2(0,0);
    
    
    static func feedback(print: [String:String])->String{
        var str: String = ""
        for (kind, report) in print{
            
            if ((kind==monitor[tog]) && (report != lastCheck)){
                str+=String("\(monitor[tog]):...\n\(report)\n")
                lastCheck = report
                checks[(monitor[tog])]=""
            }
        }
        return str
    }
    
    static func print(){
        let print = self.feedback(checks)
        if (print != ""){
            println(print)
        }
    }
    

    
    static func cycle(dir: Int){
        tog += dir
        if (tog>=monitor.count) {
            tog=0
        }else if (tog<0){
            tog = monitor.count-1
        }
    }
    
    static func add(key: String, message: String) {
        if (nil == checks.indexForKey(key)){
            checks.updateValue(message, forKey: key)
            monitor.append(key)
        }
        else {
            checks[key]?.extend(message)
        }
        
    }
    
    static func debug(key: String, message: String = "TODO"){
        add(key, message: message)
    }
    
    
   
    static func log(log: String){
        self.logs.append(log)
    }
    
    static func printLog() {
        if !isDebugging { return }
        logs.append(feedback(checks))
        var output: String = "\n"//log
        var longest:Int = 0
        for log in logs {
            if log.utf16Count > longest {
                longest = log.utf16Count
            }
        }
        for log in logs {
            let diff:Int = longest - log.utf16Count
            let spacer: String = log.hasPrefix("=>") ? "=" : " "
            for (var i:Int = 0; i<diff;++i){
                output += spacer
            }
            output += log
            output += "\n"
        }
        
        NSLog(output)
        logs.removeAll(keepCapacity: true)
    }
    
    static func makeData(file: String = __FILE__, funcName: String = __FUNCTION__, line: Int = __LINE__, col: Int = __COLUMN__, args: String?...) -> String{
        
        var result: String =  args.isEmpty ? "" : "|| INFO "//\(args!)"
        for arg in args {
            result += "- \(arg)"
        }
        for data in args {
            result += "::"
        }
        
        return "=> \(funcName) in \(file.lastPathComponent) on line: \(line):\(col)\(result)"
    }
}

public func RMXLog(var logs: String, file: String = __FILE__, funcName: String = __FUNCTION__, line: Int = __LINE__, column: Int = __COLUMN__) {
    //for log in logs
    var log: String = ""
    if logs.hasPrefix("---") {
        log = RMX.makeData(file: file,funcName: funcName, line: line, col: column) + " "
    }
    
    log += logs
    RMX.log(log)
    //RMXFatalError()
}

public func RMXLog(object: AnyObject, var message: String, file: String = __FILE__,  funcName: String = __FUNCTION__, line: Int = __LINE__,  column: Int = __COLUMN__) {
    var log: String = ""
    if message.hasPrefix("---") {
        log = RMX.makeData(file: file,funcName: funcName, line: line, col: column) + " "
    }
    RMX.add(object.description != nil ? object.name! : object.description , message: log)
    //}
}

@noreturn func RMXFatalError(sender: AnyObject = "", file: String = __FILE__, funcName: String = __FUNCTION__, line: Int = __LINE__, col: Int = __COLUMN__) {
    let error = RMX.makeData(file: file,funcName: funcName, line: line, col: col)
    var underline = "\n"
    for c in error {
        underline += "-"
    }
    fatalError("\n --- RMXFatalError --- ... \"\(sender.description)\"\n\(error)\n\(underline)\n")
}

//@noreturn func fatalError(_ message: @autoclosure () -> String = default, file: StaticString = default, line: UWord = default)
