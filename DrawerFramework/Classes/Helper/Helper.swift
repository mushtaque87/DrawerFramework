
import UIKit

enum PracticeType : String   {
    case practice
    case vocablary
    case freeText
}


final public class Helper: NSObject {

    static func getDocumentDirectory() -> String
    {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as NSArray
        let documentsDirectory = paths.object(at: 0) as! String
        return documentsDirectory
    }
 
    static func copyFileFromBundle(to directory:() -> String, filename file:String , ofType type:String) {
        let path = directory().appendingFormat(String(format: "%@.%@",file, type))
        guard let bundlePath = Bundle.main.path(forResource: file, ofType: type) else { return }
        
        let fileManager = FileManager.default
        do {
            if fileManager.fileExists(atPath: path) {
            try fileManager.removeItem(atPath: path)
            }
            try fileManager.copyItem(atPath: bundlePath, toPath: path)
        } catch let error  {
            Helper.printLogs(with: error.localizedDescription)
        }
    }
    
    static func updateFileFromBundle(to directory:() -> String, filename file:String , ofType type:String) {
       
        let path = directory().appendingFormat(String(format: "%@.%@",file, type))
        guard let bundlePath = Bundle.main.path(forResource: file, ofType: type) else { return }

        let fileManager = FileManager.default
        if !fileManager.fileExists(atPath: path) {
            do {
                try fileManager.copyItem(atPath: bundlePath, toPath: path)
            } catch _ as NSError {
            }
        } else
        {
            Helper.updateFile(at:path, withFileFrom:bundlePath)
        }
    }

    static func fileExist(at path:String) -> Bool
    {
        let fileManager = FileManager.default
        return fileManager.fileExists(atPath: path)
    }
    
    static func updateFile(at path:String , withFileFrom bundlepath:String) {
        
        let bundlefile:NSMutableDictionary = NSMutableDictionary(contentsOfFile: bundlepath)!
        let documentFile:NSMutableDictionary = NSMutableDictionary(contentsOfFile: path)!

        for bundlekey in bundlefile.allKeys {
            var found = false
            for filekey in documentFile.allKeys {
                if bundlekey as! String == filekey as! String {
                    found = true
                    break
                }
            }
            if found {
            } else {
            }
        }
    }
    
    static func readJsonFile(at path:String , ofType type:String) -> Data?
    {
        var data : Data?
        guard Bundle.main.path(forResource: path, ofType: type) != nil else {
            return nil
            
        }
        
        do {
            if let file = Bundle.main.url(forResource: path, withExtension: type) {
                data = try Data(contentsOf: file)
               
                let json = try JSONSerialization.jsonObject(with: data!, options: [])
                if json is [String: Any] {
                    // json is a dictionary
                } else if json is [Any] {
                    // json is an array
                } else {
                }
            } else {
            }
        } catch {
        }
        return data
    }

static func createDirectory(with folderName:String)
{
    do{
        try FileManager.default.createDirectory(atPath: getDocumentDirectory().appendingFormat(String(format: "%@",folderName)), withIntermediateDirectories: true, attributes: nil)
    } catch {
        Helper.printLogs(with: "Error: \(error.localizedDescription)")
    }
}

    static func getAudioDirectory(for  type:PracticeType) -> String
    {
        switch type {
        case .practice:
            return getDocumentDirectory().appendingFormat("Practice")
        case .vocablary:
            return getDocumentDirectory().appendingFormat("Vocabulary")
        case .freeText:
            return getDocumentDirectory().appendingFormat("FreeText")

        }
    }
  
  
    
    //MARK: - Device Idioms
    enum UIUserInterfaceIdiom : Int {
        case unspecified
        case phone // iPhone and iPod touch style UI
        case pad // iPad style UI
    }
    
    static func getCurrentDevice() -> UIUserInterfaceIdiom {
        var currentDevice : UIUserInterfaceIdiom?
        switch UIDevice.current.userInterfaceIdiom {
        case .phone:
        // It's an iPhone
            currentDevice = UIUserInterfaceIdiom.phone
            break
        case .pad:
        // It's an iPad
            currentDevice = UIUserInterfaceIdiom.pad
            break
        case .unspecified:
            // Uh, oh! What could it be?
            currentDevice = UIUserInterfaceIdiom.unspecified
            break
        case .tv:
            currentDevice = UIUserInterfaceIdiom.unspecified
            break
        case .carPlay:
            currentDevice = UIUserInterfaceIdiom.unspecified
            break
        }
        return currentDevice!
    }
    
    //MARK: - Print Logs
   public static func printLogs(with value:String = " ", file: String = #file,  methodName:String = #function ,  line: Int = #line ) {
        #if DEBUG
        NSLog("Pronounce %@ |\n %@ - %d : %@",methodName,file,line,value)
        #else
        #endif
    }
    
}
