//
//  MyTableViewCell.swift
//  Test
//
//  Created by Erik on 27.01.2024.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var myTitleLableOnCell: UILabel!
    
    @IBOutlet weak var my2ndTitleLableOnCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

//    func configure(){
//        myTitleLableOnCell.text = " Hello affasfa asasfasf asasf Hello affasfa asasfasf asasf Hello affasfa asasfasf asasf "
//    }
    
    func configure (_ post: Post){
        myTitleLableOnCell.text = post.title
        my2ndTitleLableOnCell.text = post.body
    }
}
