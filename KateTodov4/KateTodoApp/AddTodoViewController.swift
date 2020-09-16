//
//  AddTodoViewController.swift
//  TodoApp
//
//  Created by student on 4/15/16.
//  Copyright © 2016 student. All rights reserved.
//

import UIKit

class AddTodoViewController: UIViewController {

    
    @IBOutlet weak var nameText: UITextField!
    
    @IBAction func saveButtonTapped(sender: UIBarButtonItem) {
        if nameText.text != "" {
            TodoManager.sharedInstance.addNewTodoWithName(nameText.text!)
            navigationController?.popViewControllerAnimated(true)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        nameText.layer.cornerRadius = 5
        nameText.layer.borderColor = UIColor(red: 0x61/256.0, green: 0xD6/256.0, blue: 0xD1/256.0, alpha:1).CGColor
        nameText.layer.borderWidth = 1
        nameText.clipsToBounds = true
        let paddingView = UIView(frame: CGRectMake(0, 0, 15, nameText.frame.height))
        nameText.leftView = paddingView
        nameText.leftViewMode = UITextFieldViewMode.Always
        
        // Do any additional setup after loading the view.
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
