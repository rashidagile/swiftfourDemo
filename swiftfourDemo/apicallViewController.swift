//
//  apicallViewController.swift
//  swiftfourDemo
//
//  Created by agile-m-32 on 23/01/18.
//  Copyright © 2018 agile-m-32. All rights reserved.
//

import UIKit
import Alamofire

//https://www.youtube.com/watch?v=P6NEUpLhpUM
//https://jsonplaceholder.typicode.com/
// "Xcode 9 , Swift 4 Debugging Tips and Tricks" = https://www.youtube.com/watch?v=uDjWH5Rus1c

class apicallViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //postApiCall()
        postApiCallUsingDecodable()
        
    }
    
    func postApiCallUsingDecodable()
    {
        let requestString = "http://nexusecare.com/MyHealthCompanionAPI2/api/user/usermessages" //"http://sandbox.nexusecare.com/MyHealthCompanionAPI/api/BookService/servicecategories"
        
        let param = ["registration_id" : 7024,"page_no" : 0] as [String : Any]
        
        Alamofire.request(requestString, method: .post, parameters: param, headers: [:]).responseData { (response) in

            do{
                let  modelObj = try JSONDecoder().decode(inboxListData.self, from: response.data!)
                
                print(modelObj.data.maxpagesize)
                let arrMsg = modelObj.data.messages
                
                print(arrMsg[0].message_subject)
                
            }
            catch let error{
                
                print(error.localizedDescription)
            }
            
            return
            switch response.result
            {
            case.success(_):
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                }
                
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func postApiCall()
    {
        /*
        let headers: HTTPHeaders = [
            "Accept": "application/json",
            ]
         */
       // let params = ["":""]
        
        
        
        
        let requestString = "http://202.131.117.90/UdgamApi_v2/App_Services/UdgamService_V8.asmx/CircularNotice" //"http://sandbox.nexusecare.com/MyHealthCompanionAPI/api/BookService/servicecategories"
        
        let param = ["sid" : 2011029,"notificationid" : 0] as [String : Any]
       
        Alamofire.request(requestString, method: .post, parameters: param, headers: [:]).responseJSON { (response:DataResponse<Any>) in
            
            switch response.result
            {
            case.success(_):
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                }
                
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
        
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

struct inboxListData : Decodable
{
    var code:Int?
    var data : inboxDetails
    var message:String?
}
struct inboxDetails : Decodable
{
    var maxpagesize:Int
    var messages:[inboxListStructModel]
}

struct inboxListStructModel: Decodable {
    
    var message_body:String = ""
    var isread:Int = 0
    var message_id :Int = 0
    
    var message_subject:String = ""
    var message_type:String = ""
    var received_date :String = ""
    
    var sender_name:String = ""
    var sender_photourl:String = ""

}
