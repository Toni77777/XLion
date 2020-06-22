//
//  Int+extension.swift
//  XLion
//
//  Created by Anton Polyakov on 6/22/20.
//  Copyright © 2020 Anton Paliakou. All rights reserved.
//

import Foundation

extension Int {

    var isSuccessCode: Bool {
        return self >= 200 && self <= 299
    }
}
