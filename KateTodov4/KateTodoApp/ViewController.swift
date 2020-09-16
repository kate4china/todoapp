//
//  ViewController.swift
//  TodoApp
//
//  Created by student on 4/15/16.
//  Copyright © 2016 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController,
    UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var emptyLabel: UILabel!
    @IBOutlet weak var leftBar: UIView!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    
    // MARK: Tableview Datasource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if TodoManager.sharedInstance.count == 0 {
            leftBar.hidden = true
            emptyLabel.hidden = false
        } else {
            leftBar.hidden = false
            emptyLabel.hidden = true
        }
        
        return TodoManager.sharedInstance.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! TodoTableViewCell
        cell.todo = TodoManager.sharedInstance.todoAtIndex(indexPath.row)
        
        return cell
    }
    
    
    
    
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .Normal, title: "Delete") { (action: UITableViewRowAction, indexPath: NSIndexPath) -> Void in
            TodoManager.sharedInstance.deleteTodoAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Left)
        }
        
        delete.backgroundColor = UIColor.redColor()
        
        return [delete]
    }
    
    
    
    
    // MARK: View Lifecycle
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController!.navigationBar.setBackgroundImage(UIImage(named: "smallgradient"), forBarMetrics: .Default)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

