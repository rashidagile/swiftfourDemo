//
//  basicTableDemoViewController.swift
//  swiftfourDemo
//
//  Created by agile-m-32 on 14/11/17.
//  Copyright © 2017 agile-m-32. All rights reserved.
//

import UIKit

class basicTableDemoViewController: UIViewController {

    
    @IBOutlet weak var tblListing: UITableView!
    
    var variable1 : Int = 0 {
        didSet{
            print("didSet called")
            print(variable1)
        }
        willSet(newValue){
            print("willSet called")
            print(newValue)
            print(variable1)
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        tblListing.estimatedRowHeight = 44
        tblListing.rowHeight = UITableViewAutomaticDimension
        
        
        
        print("we are going to add 3")
        
        variable1 = 3
        
        print("we added 3")
        
        variable1 = 15
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

extension basicTableDemoViewController:UITableViewDelegate,UITableViewDataSource,UITableViewDataSourcePrefetching
{
    /*
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableViewAutomaticDimension
        
        
    }
    */
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:basicTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)  as! basicTableViewCell
        
        cell.lblContent.text = "Agile Infoways Nehrunagar Ahmedabad - 380001 \n Agile Infoways Nehrunagar Ahmedabad - 380001 \n Agile Infoways Nehrunagar Ahmedabad - 380001"
        
        
        return cell
    }
    
    
}
