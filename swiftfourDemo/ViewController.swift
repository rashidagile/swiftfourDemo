//
//  ViewController.swift
//  swiftfourDemo
//
//  Created by agile-m-32 on 13/11/17.
//  Copyright © 2017 agile-m-32. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var items =
        [Model(urlString: "http://www.gstatic.com/webp/gallery/1.jpg"),
         Model(urlString: "http://www.gstatic.com/webp/gallery/2.jpg"),
         Model(urlString: "http://www.gstatic.com/webp/gallery/3.jpg"),
         Model(urlString: "http://www.gstatic.com/webp/gallery/4.jpg"),
         Model(urlString: "http://www.gstatic.com/webp/gallery/5.jpg"),
         Model(urlString: "http://imgsv.imaging.nikon.com/lineup/coolpix/a/a/img/sample/img_06_l.jpg"),
         Model(urlString: "http://imgsv.imaging.nikon.com/lineup/coolpix/a/a/img/sample/img_07_l.jpg"),
         Model(urlString: "http://imgsv.imaging.nikon.com/lineup/coolpix/a/a/img/sample/img_08_l.jpg"),
         Model(urlString: "http://imgsv.imaging.nikon.com/lineup/coolpix/a/a/img/sample/img_09_l.jpg"),
         Model(urlString: "http://imgsv.imaging.nikon.com/lineup/coolpix/a/a/img/sample/img_10_l.jpg"),
         Model(urlString: "https://www.gstatic.com/webp/gallery3/1.png"),
         Model(urlString: "https://www.gstatic.com/webp/gallery3/2.png"),
         Model(urlString: "https://www.gstatic.com/webp/gallery3/3.png"),
         Model(urlString: "https://www.gstatic.com/webp/gallery3/4.png"),
         Model(urlString: "https://www.gstatic.com/webp/gallery3/5.png")]
    
    /// We store all ongoing tasks here to avoid duplicating tasks.
    fileprivate var tasks = [URLSessionTask]()

    @IBOutlet weak var tblListing: UITableView!
    
    var blockTableViewDidSelectAtIndexPath:((String)->Void)?
    
    var testblockButtonTaped:((String)->Void)?
    
    
    var testParam = ""{
        didSet {
            print("test param value changed")
        }
    }
    
    
    
    let myFirstClosure = {
        "Agile Infoways"
    }
    
    
    var closureName = { (myString : String) -> (String) in
        return myString
    }
    
    typealias closure = (Int , Int) -> ()
    
    
    typealias CompletionHandler = (Bool,String,Int) -> Void
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print("test commit....")
        
        if(self.blockTableViewDidSelectAtIndexPath != nil)
        {
            self.blockTableViewDidSelectAtIndexPath!("Agile Infoways")
        }
        
        if self.testblockButtonTaped != nil
        {
            self.testblockButtonTaped!("123456789")
        }
        
        
        
        
    print("View did load \(UIScreen.main.bounds.size.height)")
        
        
        print(myFirstClosure())
        
        let test = closureName("Hello")

        print(test)
        
        self.myClosureFunction { (a, b) in
            print(a)
            print(b)
        }
        
        let details = personalDetails()
        
        print(details("Abc","Xyz"))
        
        Logout(completionHandler: { (success) in
            if success
            {
                print("true")
            }
            else
            {
                print("false")
            }
        }, a: "false")
        
        closureReturn(firstValue: 10, secondValue: 20) { (istrue, test, a) in
            
        }
        
        print(testParam)
        
    }
    
    func closureReturn(firstValue:Int,secondValue:Int, withCompletionHandler:(CompletionHandler)) {
        
        /*
        if(isTest){
            withCompletionHandler("Yes")
        }
        else{
            withCompletionHandler("No")
        }
         */
        
       withCompletionHandler(true,"",1)
    }
    
   
    
    override func viewWillAppear(_ animated: Bool) {
        
       
     
       
        
    }
    
    
    
    func personalDetails () -> ((String, String) -> String) {
        
        func fullname(name: String, last: String) -> (String) {
            return name + last
        }
        return fullname
    }
    
    
    
    func Logout(completionHandler:@escaping (Bool) -> (),a:String) {
        
        if a == "true"
        {
            completionHandler(true)
        }
        else
        {
            completionHandler(false)
        }
        
        
        
    }
    
    func myClosureFunction(action:closure) -> ()
    {
        action(5, 5)
    }
    
    // MARK: - Image downloading
    
    fileprivate func downloadImage(forItemAtIndex index: Int) {
        let url = items[index].url
        guard tasks.index(where: { $0.originalRequest?.url == url }) == nil else {
            // We're already downloading the image.
            return
        }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            // Perform UI changes only on main thread.
            DispatchQueue.main.async {
                if let data = data, let image = UIImage(data: data) {
                    self.items[index].image = image
                    // Reload cell with fade animation.
                    let indexPath = IndexPath(row: index, section: 0)
                    if self.tblListing.indexPathsForVisibleRows?.contains(indexPath) ?? false {
                        self.tblListing.reloadRows(at: [IndexPath(row: index, section: 0)], with: .fade)
                    }
                }
            }
        }
        task.resume()
        tasks.append(task)
    }
    fileprivate func cancelDownloadingImage(forItemAtIndex index: Int) {
        let url = items[index].url
        // Find a task with given URL, cancel it and delete from `tasks` array.
        guard let taskIndex = tasks.index(where: { $0.originalRequest?.url == url }) else {
            return
        }
        let task = tasks[taskIndex]
        task.cancel()
        tasks.remove(at: taskIndex)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        print("View did appear \(UIScreen.main.bounds.size.height)")
        print("Physical bound View did appear \(UIScreen.main.nativeBounds.size.height)")
        print(self.view.frame.size.height)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
struct Model {
    let urlString: String
    lazy var url: URL = {
        // I know it's unsafe.
        return URL(string: self.urlString)!
    }()
    var image: UIImage?
    
    init(urlString: String) {
        self.urlString = urlString
    }
}
// MARK: - UITableViewDataSourcePrefetching
extension ViewController: UITableViewDataSourcePrefetching,UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        print("prefetchRowsAt \(indexPaths)")
        
        print("prefetchRowsAt \(indexPaths)")
        indexPaths.forEach { self.downloadImage(forItemAtIndex: $0.row) }
    }
    
    func tableView(_ tableView: UITableView, cancelPrefetchingForRowsAt indexPaths: [IndexPath]) {
        print("cancelPrefetchingForRowsAt \(indexPaths)")
        indexPaths.forEach { self.cancelDownloadingImage(forItemAtIndex: $0.row) }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath)
        
        if let imageView = cell.viewWithTag(100) as? UIImageView {
            if let image = items[indexPath.row].image {
                imageView.image = image
            } else {
                imageView.image = nil
                self.downloadImage(forItemAtIndex: indexPath.row)
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
}

