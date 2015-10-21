//
//  MyViewController.swift
//  Fibonacci
//
//  Created by Kody O'Connell on 9/22/15.
//  Copyright © 2015 Kody O'Connell. All rights reserved.
//

import Foundation
import UIKit

class MyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    var myCellStrings = [String]()
    
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.dataSource = self
        myTableView.delegate = self
        
        let maxInt = Int.max
        let maxUInt64 = UInt64.max
        print("max UInt64 is \(maxUInt64)\n")
        print("max    Int is \(maxInt)\n")
        
        myCellStrings = makeFibStringArray()
        
        print("size of array is \(myCellStrings.count)")
        
        for text in myCellStrings {
            print(text)
        }
        
       
    }
    
    
    func makeFibStringArray() -> [String] {
        
        var theArray = [String]()
        
        let myFib = Fibonacci().generate()
        var N = 0
        
            //use generator to get numbers from sequence up to storage limit and store in string array for display
        while true {
            if let result = myFib.next() {
                
                if N > 1 && result == 0  {
                    print("greater than maxInt, ending..")
                    break
                }
                
                    //make string
                let nextString = "F(\(N)) = \(result)"
                
                    //store string in array
                theArray += [nextString]
            }
            N++
        }
        
        return theArray
    }
    
    
    
    
    
    
    
    
    
    
    //MARK: - Data Source
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myCellStrings.count
      
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("myCell",
            forIndexPath: indexPath) 
        
        cell.textLabel?.text = myCellStrings[indexPath.row]
        
        return cell
        
    }
    
}
