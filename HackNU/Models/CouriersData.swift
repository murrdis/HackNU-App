//
//  CouriersData.swift
//  HackNU
//
//  Created by Диас Мурзагалиев on 15.04.2023.
//

import Foundation


struct CouriersData: Decodable {
    let id: Int
    let name, login, password: String
    let service: Service
}

// MARK: - Service
struct Service: Decodable {
    let id: Int
    let name: String
}
