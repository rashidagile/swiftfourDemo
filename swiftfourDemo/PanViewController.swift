//
//  PanViewController.swift
//  NavigationDemo
//
//  Created by agile on 07/09/16.
//  Copyright © 2016 agile. All rights reserved.
//

import UIKit

class PanViewController: UIViewController {
    
    
    
    @IBOutlet var testView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        /*
        UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(moveViewWithGestureRecognizer:)];
        [self.testView addGestureRecognizer:panGestureRecognizer];
        */
        
        let panGestureRecognizer:UIPanGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(moveViewWithGestureRecognizer))
        
        self.testView.addGestureRecognizer(panGestureRecognizer)
        
        
        
        
    }
    
    
    
    @objc func moveViewWithGestureRecognizer(panGestureRecognizer:UIPanGestureRecognizer)
    {
        let touchLocation:CGPoint = panGestureRecognizer.location(in: self.view)
        
        self.testView.center = touchLocation
        
        let velocity:CGPoint = panGestureRecognizer.velocity(in: self.view)
        
        
       // CGFloat magnitude = sqrtf((velocityPoint.x * velocityPoint.x) + (velocityPoint.y * velocityPoint.y));
        
        //let magnitude:Float = sqrtf((velocity.x * velocity.x) + (velocity.y * velocity.y));
        
       // print(magnitude)
        
        print(velocity)
        
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
