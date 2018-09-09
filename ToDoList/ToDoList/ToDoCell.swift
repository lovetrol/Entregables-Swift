//
//  ToDoCell.swift
//  ToDoList
//
//  Created by Marths! on 31/08/18.
//  Copyright © 2018 Marths!. All rights reserved.
//



import UIKit

protocol ToDoCellDelegate {
    func checkMarkTapped(_ sender: ToDoCell)
}

class ToDoCell: UITableViewCell {
    
    @IBOutlet weak var isCompleteButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    var delegate: ToDoCellDelegate?
    
    @IBAction func isCompleteButtonTapped(_ sender: UIButton) {
        delegate?.checkMarkTapped(self)
    }
}
