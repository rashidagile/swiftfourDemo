//
//  collectiondemoViewController.swift
//  swiftfourDemo
//
//  Created by agile-m-32 on 21/11/17.
//  Copyright © 2017 agile-m-32. All rights reserved.
//

import UIKit

class collectiondemoViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    
    
    let SCREEN_WIDTH = UIScreen.main.bounds.size.width
    let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
    
    
    @IBOutlet weak var colLiting: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews()
    {
        /*
         let flowLayout :UICollectionViewFlowLayout = UICollectionViewFlowLayout();
         
         // flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
         
         //flowLayout.itemSize = CGSize(width: (SCREEN_WIDTH-40)/3, height: (SCREEN_WIDTH-40)/3)
         
         //let getDiffn = (SCREEN_WIDTH - 265) / 2
         
         flowLayout.minimumInteritemSpacing = 20
         flowLayout.minimumLineSpacing = 15
         flowLayout.sectionInset = UIEdgeInsetsMake(20, 20, 20, 20)
         colView.setCollectionViewLayout(flowLayout, animated: true)
         */
    }
    
    //MARK: - Collectionview delegate and datasource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 5
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        
        return CGSize(width: ((SCREEN_WIDTH - 80) / 3), height: ((SCREEN_WIDTH - 80) / 3))
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
