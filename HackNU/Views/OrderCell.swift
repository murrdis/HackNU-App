//
//  OrderCell.swift
//  HackNU
//
//  Created by Диас Мурзагалиев on 15.04.2023.
//

import UIKit

class OrderCell: UITableViewCell {

    @IBOutlet weak var OuterView: UIView!
    
    @IBOutlet weak var Ellipse: UIView!
    
    @IBOutlet weak var FromLabel: UILabel!
    
    @IBOutlet weak var ToLabel: UILabel!
    
    @IBOutlet weak var PriceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = self.bounds.height / 2
        self.clipsToBounds = true
        
        Ellipse.layer.cornerRadius = Ellipse.frame.height / 3
        Ellipse.layer.borderWidth = 0.2
        Ellipse.layer.borderColor = UIColor.black.cgColor
        Ellipse.backgroundColor = UIColor.clear
        
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension UIView {
    func applyshadowWithCorner(containerView : UIView, cornerRadious : CGFloat){
        containerView.clipsToBounds = false
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOpacity = 1
        containerView.layer.shadowOffset = CGSize.zero
        containerView.layer.shadowRadius = 10
        containerView.layer.cornerRadius = cornerRadious
        containerView.layer.shadowPath = UIBezierPath(roundedRect: containerView.bounds, cornerRadius: cornerRadious).cgPath
        self.clipsToBounds = true
        self.layer.cornerRadius = cornerRadious
    }
}
