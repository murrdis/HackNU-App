//
//  OrdersViewController.swift
//  HackNU
//
//  Created by Диас Мурзагалиев on 15.04.2023.
//

import UIKit

class OrdersViewController: UIViewController {
    
    
    @IBOutlet weak var TopEllipse: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    let api = "http://91.201.214.131:8080/orders/status/1?sid="
    var couriersID: Int = -100
    var courierPhone = "0"
    var serviceID: Int = -100
    var index: Int = 0
    var orders: [OrderData] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        navigationItem.hidesBackButton = true
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        TopEllipse.layer.cornerRadius = TopEllipse.frame.height / 5

        tableView.delegate = self
        tableView.dataSource = self

        tableView.register(UINib(nibName: "OrderCell", bundle: nil), forCellReuseIdentifier: "OrderCell")
        loadOrders()
        print(orders.count)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Call the data reloading function here
        loadOrders()
        
    }


    func loadOrders() {
        if let url = URL(string: "\(api)\(serviceID)") {
            print(url)
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { [weak self] data, response, error in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    self?.parseJSON(safeData)
                }
            }
            task.resume()
        }
    }

    func parseJSON(_ safeData: Data){
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode([OrderData].self, from: safeData)
            self.orders = decodedData
            print(orders[0].price)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            print(orders.count)
        } catch {
           // make push over in error
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "FromOrdersToOrder" {
            if let destinationVC = segue.destination as? OrderViewController {
                print(String(Int(orders[index].price)))
                destinationVC.id = String(orders[index].id)
                destinationVC.clientPhone = orders[index].clientPhone
                destinationVC.courierPhone = courierPhone
                destinationVC.clientName = orders[index].clientName
                destinationVC.document = "Справка"
                destinationVC.issuingDepartment = orders[index].issuingDepartment
                destinationVC.issuingDepartmentAddress = orders[index].issuingDepartment
                destinationVC.destinationAddress = "\(orders[index].destinationStreet), \(orders[index].destinationHome), \(orders[index].destinationFlat)"
                destinationVC.price = "\(orders[index].price)"
                
                destinationVC.couriersID = couriersID
            }
        }
    }
}


extension OrdersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderCell", for: indexPath) as! OrderCell
        cell.FromLabel.text = orders[indexPath.row].issuingDepartment
        cell.ToLabel.text = "\(orders[indexPath.row].destinationStreet), \(orders[indexPath.row].destinationHome), \(orders[indexPath.row].destinationFlat)"
        cell.PriceLabel.text = "\(String(orders[indexPath.row].price)) тг"
        return cell
    }
    
}

extension OrdersViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index = indexPath.row

        self.performSegue(withIdentifier: "FromOrdersToOrder", sender: self)
    }
}

/*
// MARK: - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // Get the new view controller using segue.destination.
    // Pass the selected object to the new view controller.
}
*/
