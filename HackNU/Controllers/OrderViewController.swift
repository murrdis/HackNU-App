//
//  OrderViewController.swift
//  HackNU
//
//  Created by Диас Мурзагалиев on 16.04.2023.
//

import UIKit

class OrderViewController: UIViewController {

    let apiSMS = "http://91.201.214.131:8080/sms?phone="
    
    var id = ""
    var clientName = ""
    var clientPhone = ""
    var courierPhone = "0"
    var document = ""
    var issuingDepartment = ""
    var issuingDepartmentAddress = ""
    var destinationAddress = ""
    var price = ""
    
    @IBOutlet weak var RequestIdLabel: UILabel!
    @IBOutlet weak var FullNameLabel: UILabel!
    @IBOutlet weak var DocumentLabel: UILabel!
    @IBOutlet weak var IssuingDepartmentLabel: UILabel!
    @IBOutlet weak var IssuingDepartmentAddressLabel: UILabel!
    @IBOutlet weak var DestinationAddressLabel: UILabel!
    @IBOutlet weak var PriceLabel: UILabel!
    
    var couriersID = -100
    let api = "http://91.201.214.131:8080/orders/"
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
        RequestIdLabel.text = "Номер заказа:\(id)"
        FullNameLabel.text = clientName
        DocumentLabel.text = document
        IssuingDepartmentLabel.text = issuingDepartment
        IssuingDepartmentAddressLabel.text = issuingDepartmentAddress
        DestinationAddressLabel.text = destinationAddress
        PriceLabel.text = price
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func AcceptButtonPressed(_ sender: UIButton) {
        makePostRequest()
        let randomNumber = Int.random(in: 10000..<100000)

        sendSMS(phone: String(courierPhone), message: String(randomNumber))
        sendSMS(phone: String(clientPhone), message: String(randomNumber))

    }
    
    
    func sendSMS(phone: String, message: String) {
        if let url = URL(string: "\(apiSMS)\(phone)&text=\(message)") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { [weak self] data, response, error in
                if error != nil {
                    print(error!)
                    return
                }
            }
            task.resume()
        }
    }
    
    
    func makePostRequest() {
        // Create a URL object
        let urlString = "\(api)\(id)/process?c=\(couriersID)"
        guard let url = URL(string: urlString) else {
            print("Error: Invalid URL")
            return
        }

        // Create a URLRequest object with the URL and set the HTTP method to POST
        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        // Set the request body, if needed
        // let postString = "param1=value1&param2=value2"
        // request.httpBody = postString.data(using: .utf8)

        // Create a URLSessionDataTask object and send the request
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            // Handle the response
            if let error = error {
                print("Error: \(error)")
            }
            guard let data = data else {
                print("No data received")
                return
            }
            if let response = response as? HTTPURLResponse {
                print("Status code: \(response.statusCode)")
            }
            if let responseString = String(data: data, encoding: .utf8) {
                print("Response: \(responseString)")
            }
        }
        task.resume()


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
