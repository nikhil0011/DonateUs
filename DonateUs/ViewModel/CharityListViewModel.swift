//
//  CharityListViewModel.swift
//  DonateUs
//
//  Created by Nikhil on 15/01/20.
//  Copyright © 2020 Nikhil. All rights reserved.
//

import Foundation
class CharityListViewModel {
    var bindableCharityList = Bindable<ChairtyListResponse, String>()
    // Do any additional setup after loading the view.
    lazy var successHandler: (ChairtyListResponse) -> Void = { (data) in
        print(data)
        self.bindableCharityList.value = data
    }
    lazy var errorHandler: (String) -> Void = { (error) in
        print(error)
        self.bindableCharityList.anotherValue = error
    }
    func returnPickupList() {
        NetworkLayer().get(urlString:  EndPoints.BASE_URL + EndPoints.GET_CONTACTS, successHandler: successHandler, errorHandler: errorHandler)
    }
}
struct CharityCellViewModel {
    let data: Organisation
}
