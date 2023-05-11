//
//  Order.swift
//  HackNU
//
//  Created by Диас Мурзагалиев on 15.04.2023.
//

import Foundation

struct OrderData: Decodable{
    let id: Int
    let requestId, issuingDepartment, clientName, clientSurname: String 
    let clientIin, clientPhone, destinationStreet, destinationHome, destinationFlat: String
    let price: Double
}

/*
 "id": 2,
     "requestId": "Request 2",
     "issuingDepartment": "Department 2",
     "clientName": "Name 2",
     "clientSurname": "Surname 2",
     "clientIin": "Iin 2",
     "clientPhone": "Phone 2",
     "destinationStreet": "Street 2",
     "destinationHome": "Home 2",
     "destinationFlat": "Flat 2",
     "price": 2000,
 */
