//
//  Bindable.swift
//  DonateUs
//
//  Created by Nikhil on 15/01/20.
//  Copyright © 2020 Nikhil. All rights reserved.
//

import Foundation
class Bindable<T, V> {
    var value: T? {
        didSet {
            observer?(value, anotherValue)
        }
    }
    var anotherValue: V? {
        didSet {
            observer?(value, anotherValue)
        }
    }
    var observer: ((T?, V?) -> Void)?
    func bind(observer: @escaping (T?, V?) -> Void) {
        self.observer = observer
    }
}
