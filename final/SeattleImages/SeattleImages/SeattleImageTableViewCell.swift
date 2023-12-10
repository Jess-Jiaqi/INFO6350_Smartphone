//
//  SeattleImageTableViewCell.swift
//  SeattleImages
//
//  Created by Jiaqi Li on 12/9/23.
//

import UIKit

class SeattleImageTableViewCell: UITableViewCell {

    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
