//
//  TableViewCell.swift
//  DelegatePracticeApp
//
//  Created by beck on 2023/08/16.
//

import Foundation
import UIKit

protocol TableViewDelegate {
    func buttonTapAction()
}

final class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleButton: UIButton!
    
    var delagate: TableViewDelegate?
    var cellDone: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //viewDidLoadみたいなやつ
        
        titleButton.layer.masksToBounds = true
        titleButton.layer.cornerRadius = 5
    }
    
    @IBAction func buttonAction(_ sender: Any) {
        cellDone?()
        delagate?.buttonTapAction()
    }
    
}
