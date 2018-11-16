import UIKit

class StringUtility: NSObject {
    
    static func getStringOf(keyName: String) -> String {
        let dic = plistDictionary()
        let text = dic.value(forKey: keyName) as? String
        if text != nil {
            return text!
        } else {
            return keyName
        }
    }
    
    static fileprivate func plistDictionary() -> NSDictionary {
        let path = Bundle.main.bundlePath
        let fileName = "/String.plist"
        
        let finalPath = path + fileName
        let dic = NSDictionary(contentsOfFile: finalPath)!
        return dic
    }
    
}
