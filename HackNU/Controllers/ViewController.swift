import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        
        LogInTextField.layer.cornerRadius = LogInTextField.bounds.height / 2
        LogInTextField.clipsToBounds = true
        PasswordTextField.layer.cornerRadius = PasswordTextField.bounds.height / 2
        PasswordTextField.clipsToBounds = true
        LogInButton.layer.cornerRadius = LogInButton.bounds.height / 2
        LogInButton.clipsToBounds = true
        loadCouriers()
    }
    
    var couriers: [CouriersData]? = nil
    let api = "http://91.201.214.131:8080/couriers"
    var courierId = -100
    var courierPhone = "0"
    var serviceId = -100
    
    @IBOutlet weak var LogInTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    
    @IBAction func PasswordReturnPressed(_ sender: UITextField) {
        LogInToOrders()
    }
    
    @IBOutlet weak var LogInButton: UIButton!
    
    @IBAction func LogInButtonPressed(_ sender: UIButton) {
        LogInToOrders()
    }
    
    func LogInToOrders() {
        if couriers == nil {
            let alert = UIAlertController(title: "Подождите", message: "Мы загружаем базу данных", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
            }))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        if let login = LogInTextField.text, let password = PasswordTextField.text {
            for courier in couriers! {
                if courier.login == login, courier.password == password {
                    courierId = courier.id
                    serviceId = courier.service.id
                    courierPhone = courier.login
                    self.performSegue(withIdentifier: "LogInToOrders", sender: self)
                    return
                }
            }
            let alert = UIAlertController(title: "Ошибка", message: "Неверный логин или пароль", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
            }))
            self.present(alert, animated: true, completion: nil)
            
        }
    }
    
    
    func loadCouriers() {
        if let url = URL(string: api) {
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
            let decodedData = try decoder.decode([CouriersData].self, from: safeData)
            self.couriers = decodedData
        } catch {
           // make push over in error
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "LogInToOrders" {
            if let destinationVC = segue.destination as? OrdersViewController {
                destinationVC.couriersID = courierId
                destinationVC.serviceID = serviceId
                destinationVC.courierPhone = courierPhone
            }
        }
    }
    
}

