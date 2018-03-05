//
//  BirthdayData.swift
//  Birthday
//
//  Created by Calvin Chang on 05/03/2018.
//  Copyright © 2018 Sapphire Info. All rights reserved.
//

import UIKit

class BirthdayData: NSObject {

    // MARK - public/internal property
    internal var name = ""
    
    internal var birthday : Date = Date() {
        didSet {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy MM/dd"
            
            self.birthdayString = dateFormatter.string(from: birthday)
        }
    }
    
    internal var birthdayString = ""
    
}
