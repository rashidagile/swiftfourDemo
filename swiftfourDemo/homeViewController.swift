//
//  homeViewController.swift
//  swiftfourDemo
//
//  Created by agile-m-32 on 31/01/18.
//  Copyright © 2018 agile-m-32. All rights reserved.
//

import UIKit

class homeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    }

    @IBAction func btnPressed(_ sender: UIButton) {
        
        self.hidesBottomBarWhenPushed = true
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let photoVC = storyboard.instantiateViewController(withIdentifier: "selectPhotoViewController") as! selectPhotoViewController
        
        self.tabBarController?.navigationController?.pushViewController(photoVC, animated: true)
        
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
