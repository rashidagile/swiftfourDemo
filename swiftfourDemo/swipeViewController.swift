//
//  swipeViewController.swift
//  swiftfourDemo
//
//  Created by agile-m-32 on 22/11/17.
//  Copyright © 2017 agile-m-32. All rights reserved.
//

import UIKit

class swipeViewController: UIViewController {
    
    
    @IBOutlet weak var segControl: UISegmentedControl!
    
    @IBOutlet weak var tblListing: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tblListing.isUserInteractionEnabled = true
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        tblListing.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        tblListing.addGestureRecognizer(swipeLeft)
        
        
        
        let value :NSString = "5xrSPXlFR4/0Z/LBdlL+4Q=="
        
        
        let getCode = value.aes128Decrypt(withKey: "a2xhcgABCDxyz123")
        
    }
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.right:
                print("Swiped right")
                segControl.selectedSegmentIndex = 0
            case UISwipeGestureRecognizerDirection.down:
                print("Swiped down")
            case UISwipeGestureRecognizerDirection.left:
                print("Swiped left")
                segControl.selectedSegmentIndex = 1
            case UISwipeGestureRecognizerDirection.up:
                print("Swiped up")
            default:
                break
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

extension swipeViewController:UITableViewDelegate,UITableViewDataSource
{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:basicTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)  as! basicTableViewCell
        
        cell.textLabel?.text = "Agile Infoways Nehrunagar Ahmedabad - 380001 \n Agile Infoways Nehrunagar Ahmedabad - 380001 \n Agile Infoways Nehrunagar Ahmedabad - 380001"
        
        
        return cell
    }
}
