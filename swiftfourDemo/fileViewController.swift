//
//  fileViewController.swift
//  Swift3Demo
//
//  Created by agile on 04/05/17.
//  Copyright © 2017 agile. All rights reserved.
//

import UIKit

class fileViewController: UIViewController {

    
    var fileManagaer:FileManager?
    var documentDir:NSString?
    var filePath:NSString?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        fileManagaer = FileManager.default
        
        let dirPaths:NSArray=NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as NSArray
        
        print(dirPaths)
        
        documentDir=dirPaths[0] as? NSString
        
        print("path : \(documentDir)")
    }
    
    
    @IBAction func createFile(_ sender: UIButton)
    {
        var error: NSError? = nil
        filePath=documentDir?.appendingPathComponent("file1.txt") as NSString?
        fileManagaer?.createFile(atPath: filePath! as String, contents: nil, attributes: nil)
        
        filePath=documentDir?.appendingPathComponent("file2.txt") as NSString?
        fileManagaer?.createFile(atPath: filePath! as String, contents: nil, attributes: nil)
        
        self.showSuccessAlert(titleAlert: "Success", messageAlert: "File created successfully")
    }
    @IBAction func WriteFile(sender: AnyObject)
    {
        let content:NSString=NSString(string: "helllo how are you?")
        let fileContent:NSData=content.data(using: String.Encoding.utf8.rawValue)! as NSData
        fileContent .write(toFile: documentDir!.appendingPathComponent("file1.txt"), atomically: true)
        
        self.showSuccessAlert(titleAlert: "Success", messageAlert: "Content written successfully")
    }
    @IBAction func ReadFile(sender: AnyObject)
    {
        
        filePath=documentDir?.appendingPathComponent("/file1.txt") as NSString?
        
        var fileContent:NSData?
        
        fileContent = fileManagaer?.contents(atPath: filePath! as String) as NSData?
        
        let str:NSString = NSString(data: fileContent! as Data, encoding: String.Encoding.utf8.rawValue)!
        
        self.showSuccessAlert(titleAlert: "Success", messageAlert: "data : \(str)" as NSString)
        
    }
    @IBAction func MoveFile(sender: AnyObject) {
        
        let oldFilePath:String=documentDir!.appendingPathComponent("file1.txt") as String
        let newFilePath:String=documentDir!.appendingPathComponent("/folder1/file1.txt") as String
        var err :NSError?
        do {
            try fileManagaer?.moveItem(atPath: oldFilePath, toPath: newFilePath)
        } catch let error as NSError {
            err = error
        }
        if((err) != nil)
        {
            print("errorrr \(err)")
        }
        self.showSuccessAlert(titleAlert: "Success", messageAlert: "File moved successfully")
        
    }
    
    
    @IBAction func RemoveFiles(sender: AnyObject) {
        
        filePath=documentDir?.appendingPathComponent("file1.txt") as NSString?
        do {
            try fileManagaer?.removeItem(atPath: filePath as! String)
        } catch _ {
        }
        
        self.showSuccessAlert(titleAlert: "Message", messageAlert: "File removed successfully.")
    }
    
    @IBAction func DirFiles(sender: AnyObject)
    {
        
        var error: NSError? = nil
        
        var arrDirContent: [AnyObject]?
        
        do
        {
            arrDirContent = try fileManagaer!.contentsOfDirectory(atPath: documentDir as! String) as [AnyObject]?
        } catch let error1 as NSError
        {
            error = error1
            arrDirContent = nil
        }
        
        self.showSuccessAlert(titleAlert: "Success", messageAlert: "Content of directory \(arrDirContent)" as NSString)
    }
    
    @IBAction func CopyFile(sender: AnyObject)
    {
        let originalFile=documentDir?.appendingPathComponent("file1.txt")
        let copyFile=documentDir?.appendingPathComponent("copy.txt")
        do {
            try fileManagaer?.copyItem(atPath: originalFile!, toPath: copyFile!)
        } catch _ {
        }
        self.showSuccessAlert(titleAlert: "Success", messageAlert:"File copied successfully")
        
    }


    
    func showSuccessAlert(titleAlert:NSString,messageAlert:NSString)
    {
        let alert:UIAlertController=UIAlertController(title:titleAlert as String, message: messageAlert as String, preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default)
        {
            UIAlertAction in
        }
        alert.addAction(okAction)
        if UIDevice.current.userInterfaceIdiom == .phone
        {
            self.present(alert, animated: true, completion: nil)
        }
    }

    
    @IBAction func createDir(_ sender: UIButton)
    {
        
        filePath=documentDir?.appendingPathComponent("/folder1") as NSString?
        do {
            
            try fileManagaer?.createDirectory(atPath: filePath! as String, withIntermediateDirectories: false, attributes: nil)
            
            //withIntermediateDirectories = true = folder within folder(/folder1/folder2)
            
        } catch _ {
        }
        self.showSuccessAlert(titleAlert: "Success", messageAlert: "Directory created successfully")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
