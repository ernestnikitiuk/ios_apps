//
//  MyTableViewCell.swift
//  Test
//
//  Created by Erik on 27.01.2024.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var myTitleLabel: UILabel!
    
    @IBOutlet weak var myBodyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

//    func configure(){
//        myTitleLableOnCell.text = " Hello affasfa asasfasf asasf Hello affasfa asasfasf asasf Hello affasfa asasfasf asasf "
//    }
    
    func configure (_ post: Post){
        myTitleLabel.text = post.title
        myBodyLabel.text = post.body
    }
}
