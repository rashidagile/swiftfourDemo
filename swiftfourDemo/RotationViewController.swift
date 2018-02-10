//
//  RotationViewController.swift
//  NavigationDemo
//
//  Created by agile on 07/09/16.
//  Copyright © 2016 agile. All rights reserved.
//

import UIKit

class RotationViewController: UIViewController {

    
    
    @IBOutlet var testView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        /*
        UIRotationGestureRecognizer *rotationGestureRecognizer = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(handleRotationWithGestureRecognizer:)];
        [self.testView addGestureRecognizer:rotationGestureRecognizer];
        */
        
        let rotationGestureRecognizer:UIRotationGestureRecognizer = UIRotationGestureRecognizer(target: self, action: #selector(handleRotationWithGestureRecognizer))
        
        self.testView.addGestureRecognizer(rotationGestureRecognizer)
        
        
    }
    
    @objc func handleRotationWithGestureRecognizer(rotationGestureRecognizer:UIRotationGestureRecognizer)
    {
        
            self.testView.transform = self.testView.transform.rotated(by: rotationGestureRecognizer.rotation);
            
            rotationGestureRecognizer.rotation = 0.0;
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
