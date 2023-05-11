//
//  OrderProcessViewController.swift
//  HackNU
//
//  Created by Диас Мурзагалиев on 16.04.2023.
//

import UIKit

class OrderProcessViewController: UIViewController {

    var clientCode: String? = nil
    var id = ""
    var clientName = ""
    var clientPhone = ""
    var courierPhone = "0"
    var document = ""
    var issuingDepartment = ""
    var issuingDepartmentAddress = ""
    var destinationAddress = ""
    var price = ""
    
    @IBOutlet weak var TextField: UITextField!
    var couriersID = -100
    
    @IBOutlet weak var RequestIdLabel: UILabel!
    @IBOutlet weak var FullNameLabel: UILabel!
    
    @IBOutlet weak var IssuingDepartmentLabel: UILabel!
    
    @IBOutlet weak var IssuingDepartmentAddressLabel: UILabel!
    
    
    @IBOutlet weak var DestinationAddressLabel: UILabel!
    
    @IBOutlet weak var PriceLabel: UILabel!
    
    
    @IBAction func ConfirmButtonPressed(_ sender: UIButton) {
        if let code = TextField.text {
            if code == clientCode {
                self.performSegue(withIdentifier: "BackToOrders", sender: self)
            }
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
        RequestIdLabel.text = id
        FullNameLabel.text = clientName
        IssuingDepartmentLabel.text = issuingDepartment
        IssuingDepartmentAddressLabel.text = issuingDepartmentAddress
        DestinationAddressLabel.text = destinationAddress
        PriceLabel.text = price
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
