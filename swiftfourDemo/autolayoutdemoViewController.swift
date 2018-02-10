//
//  autolayoutdemoViewController.swift
//  swiftfourDemo
//
//  Created by agile-m-32 on 25/01/18.
//  Copyright © 2018 agile-m-32. All rights reserved.
//

import UIKit
import SDWebImage

class autolayoutdemoViewController: UIViewController {

    @IBOutlet weak var imgPreview: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let logoUrl = "http://sandbox-nexus.ecare.com.au/ecare5.2/ecareapp/images/uploadedphotos/10012920151223_2480_UNIHE159.jpg"
        
        let urlString = logoUrl.addingPercentEncoding( withAllowedCharacters: .urlQueryAllowed)
        
        if let url = URL(string:urlString!)
        {
            
            imgPreview.sd_setImage(with: url, placeholderImage:UIImage(named:"1.jpeg"),options: SDWebImageOptions(rawValue: 0), completed: { (image, error, cacheType, imageURL) in
                // Perform operation.
                
                if error != nil
                {
                    
                }
                
                
            })
        }
    }
    
    
    @IBAction func likePressed(_ sender: UIButton) {
        
        sender.removeFromSuperview()
        
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
