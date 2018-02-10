//
//  loginViewController.swift
//  swiftfourDemo
//
//  Created by agile-m-32 on 13/11/17.
//  Copyright © 2017 agile-m-32. All rights reserved.
//

import UIKit

class loginViewController: UIViewController {
    
    typealias testDemo = (_ a
        :Int,_ b:Int) -> Int
    
    var blockMethod : testDemo?
    
    // 1
    let defaultSession = URLSession(configuration: .default)
    // 2
    var dataTask: URLSessionDataTask?
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        Utils.printHello()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        // self.blockMethod!(10,10)
        
        
    }
    
    func getSearchResults(searchTerm: String) {
        // 1
        dataTask?.cancel()
        // 2
        if var urlComponents = URLComponents(string: "https://itunes.apple.com/search") {
            urlComponents.query = "media=music&entity=song&term=\(searchTerm)"
            // 3
            guard let url = urlComponents.url else { return }
            // 4
            dataTask = defaultSession.dataTask(with: url) { data, response, error in
                defer { self.dataTask = nil }
                // 5
                if let error = error {
                    //self.errorMessage += "DataTask error: " + error.localizedDescription + "\n"
                } else if let data = data,
                    let response = response as? HTTPURLResponse,
                    response.statusCode == 200 {
                    //self.updateSearchResults(data)
                    // 6
                    DispatchQueue.main.async {
                        //completion(self.tracks, self.errorMessage)
                    }
                }
            }
            // 7
            dataTask?.resume()
        }
    }
    
    func callFirstAPI()
    {
        // Move to a background thread to do some long running work
        DispatchQueue.global(qos: .userInitiated).async {

            // Bounce back to the main thread to update the UI
            DispatchQueue.main.async {
                
            }
        }
    }
    
    @IBAction func loginClick(_ sender: UIButton) {
        
        /*
        if self.blockMethod != nil{
            self.blockMethod?(10,10)
        }
         */
        
        /*
        let viewObj = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
        self.navigationController?.pushViewController(viewObj, animated: true)
         */
        
        
        
    }
    
    
    @IBAction func buttontaped(_ sender: UIButton)
    {
     
        sender.removeFromSuperview()
        
    }
    func testFunc(com:@escaping testDemo)
    {
       
        self.blockMethod = com
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func submitClick(_ sender: UIButton) {
        
        
        let tabBar = self.storyboard?.instantiateViewController(withIdentifier: "hometabBarController") as? hometabBarController
        
        
        
        self.navigationController?.pushViewController(tabBar!, animated: true)
        
        return
        
        if sender.titleLabel?.text == "Agile"
        {
            sender.setTitle("Agile Infoways", for: .normal)
        }
        else
        {
            sender.setTitle("Agile", for: .normal)
        }
    }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "loginView"
        {
            if let destinationVC = segue.destination as? ViewController {
                
                destinationVC.testblockButtonTaped = { value in
                    
                    print(value)
                        
                }
                destinationVC.testParam = "Test123456"
                
                
            }
        }
        
        
        
    }
    
    
    

}

public class Utils: NSObject {
     public class func printHello() {
        print("Hello from utils")
    }
}
