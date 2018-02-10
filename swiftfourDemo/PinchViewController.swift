//
//  PinchViewController.swift
//  NavigationDemo
//
//  Created by agile on 07/09/16.
//  Copyright © 2016 agile. All rights reserved.
//

import UIKit

class PinchViewController: UIViewController {

    
    @IBOutlet var testView: UIView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        /*
        UIPinchGestureRecognizer *pinchGestureRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinchWithGestureRecognizer:)];
        [self.testView addGestureRecognizer:pinchGestureRecognizer];
        */
        
        let pinchGestureRecognizer:UIPinchGestureRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(handlePinchWithGestureRecognizer))
        
        self.testView.addGestureRecognizer(pinchGestureRecognizer)
   
    }
    
    
     @objc func handlePinchWithGestureRecognizer(pinchGestureRecognizer:UIPinchGestureRecognizer)
    {
        self.testView.transform = self.testView.transform.scaledBy(x: pinchGestureRecognizer.scale, y: pinchGestureRecognizer.scale);
        
        pinchGestureRecognizer.scale = 1.0;
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
