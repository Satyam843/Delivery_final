//
//  DeliveryViewCell.swift
//  Delivery_final
//
//  Created by soc-admin on 7/30/20.
//  Copyright © 2020 soc-admin. All rights reserved.
//

import UIKit
//Protocol
protocol  Delivery {
    func OnClick(index : Int)
}
class DeliveryViewCell: UITableViewCell {
    @IBOutlet weak var cellTextField: UITextField!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var cellImageView: UIImageView!
    var celldelegate : Delivery?
    var index : IndexPath?
    override func awakeFromNib() {
        super.awakeFromNib()
        cellTextField.borderStyle = .none
        // Initialization code
    }

    @IBAction func pickLocation(_ sender: Any) {
        celldelegate?.OnClick(index: index!.row)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
