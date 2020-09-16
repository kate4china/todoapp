//
//  TodoTableViewCell.swift
//  TodoApp
//
//  Created by student on 4/22/16.
//  Copyright © 2016 student. All rights reserved.
//

import UIKit

class TodoTableViewCell: UITableViewCell {
    
    var todo: Todo? {
        didSet {
            setup()
        }
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var checkButton: UIButton!
    
    
    @IBAction func checkButtonTouch(sender: AnyObject) {
        if let todo = todo {
            if todo.completed == true {
                todo.completed = false
            } else {
                todo.completed = true
            }
            do {
                try todo.managedObjectContext?.save()
            } catch {
                abort()
            }
            
            setCheckButtonImage()
        }
    }
    
    func setup() {
        if let todo = todo {
            setCheckButtonImage()
            nameLabel.text = todo.name
            //dateLabel.text = "\(todo.completed)"
        }
    }
    
    
    func setCheckButtonImage() {
        if let todo = todo {
            var image = UIImage(named:"checkOff")

            if todo.completed == true {
                image = UIImage(named:"checkOn")
            }
            checkButton.setImage(image, forState: .Normal)
            checkButton.setImage(image, forState: .Highlighted)
            checkButton.setImage(image, forState: .Selected)
        }

    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
