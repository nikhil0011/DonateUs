//
//  ViewController.swift
//  DonateUs
//
//  Created by Nikhil on 14/01/20.
//  Copyright © 2020 Nikhil. All rights reserved.
//

import UIKit
struct Person: Codable {
    let name: String
}
class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let successHandler: (Person) -> Void = { (employees) in
            print(employees)
        }
        let errorHandler: (String) -> Void = { (error) in
            print(error)
        }
        NetworkLayer().get(urlString: EndPoints.GET_CONTACTS, successHandler: successHandler, errorHandler: errorHandler)
        NetworkLayer().post(urlString: "", body: Person(name: ""), successHandler: successHandler, errorHandler: errorHandler)
    }
}
