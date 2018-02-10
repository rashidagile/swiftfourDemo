//
//  TapViewController.swift
//  NavigationDemo
//
//  Created by agile on 07/09/16.
//  Copyright © 2016 agile. All rights reserved.
//

import UIKit

class TapViewController: UIViewController {

    
    @IBOutlet var testView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        /*
        UITapGestureRecognizer *singleTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTapGesture:)];
        [self.testView addGestureRecognizer:singleTapGestureRecognizer];
        
        
        UITapGestureRecognizer *doubleTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleTapGesture:)];
        doubleTapGestureRecognizer.numberOfTapsRequired = 2;
        //  doubleTapGestureRecognizer.numberOfTouchesRequired = 2;
        [self.testView addGestureRecognizer:doubleTapGestureRecognizer];
        */
        
        
        //let singleTapGestureRecognizer:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: Selector("handleSingleTapGesture"))
        
        let singleTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleSingleTapGesture))
        
        testView.addGestureRecognizer(singleTapGestureRecognizer)

        let doubleTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleDoubleTapGesture))
        
        // view.addGestureRecognizer(tap)
        doubleTapGestureRecognizer.numberOfTapsRequired = 2
        
        //doubleTapGestureRecognizer.numberOfTouchesRequired = 2
        
        testView.addGestureRecognizer(doubleTapGestureRecognizer)
        
        
        
        
    }
    
    @IBAction func gotoNewVC(_ sender: UIButton) {
        
       // self.hidesBottomBarWhenPushed = false
        
        //UINavigationController *rootController = self.navigationController.tabBarController.navigationController;
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "loginViewController") as! loginViewController
        
        //let rootView = self.navigationController?.tabBarController?.navigationController
        
        //rootView?.pushViewController(vc, animated: true)
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    @objc func handleDoubleTapGesture(tapGestureRecognizer:UITapGestureRecognizer)
    {
        
        var newSize:CGSize = CGSize(width: 100.0, height: 100.0) //CGSizeMake(100.0, 100.0);
        
        if (self.testView.frame.size.width == 100.0)
        {
            newSize.width = 200.0;
            newSize.height = 200.0;
        }
        
        let currentCenter:CGPoint = self.testView.center;
        
        self.testView.frame = CGRect(x: self.testView.frame.origin.x, y: self.testView.frame.origin.y, width: newSize.width, height: newSize.height) //CGRectMake(self.testView.frame.origin.x, self.testView.frame.origin.y, newSize.width, newSize.height);
        self.testView.center = currentCenter;
        
    }

    
    
    @objc func handleSingleTapGesture(tapGestureRecognizer:UITapGestureRecognizer)
    {
        var newWidth:CGFloat = 100.0
        
        if(self.testView.frame.size.width == 100.0)
        {
            newWidth = 200.0
        }
        
        let currentCenter:CGPoint = self.testView.center
        
        self.testView.frame = CGRect(x: self.testView.frame.origin.x, y: self.testView.frame.origin.y, width: newWidth, height: self.testView.frame.size.height) //CGRectMake(self.testView.frame.origin.x, self.testView.frame.origin.y, newWidth, self.testView.frame.size.height);
        
        self.testView.center = currentCenter;
        
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
