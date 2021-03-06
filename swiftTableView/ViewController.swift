//
//  ViewController.swift
//  swiftTableView
//
//  Created by Chi Zhang on 14/6/4.
//  Copyright (c) 2014年 Chi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    @IBOutlet
    var tableView: UITableView
    var items: String[] = ["China", "USA", "Russia"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return self.items.count;
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        
        cell.textLabel.text = self.items[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        println("You selected cell #\(indexPath.row)!")
        var detail:DetailViewController = self.storyboard.instantiateViewControllerWithIdentifier("detail") as DetailViewController
        detail.capitalString = self.items[indexPath.row]
//        self.presentViewController(detail,animated:true,completion:nil);
//        detail.capitalLabel.text = self.items[indexPath.row]
        self.navigationController.pushViewController(detail,animated:true)
    }
}

