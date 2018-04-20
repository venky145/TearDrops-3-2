//
//  GlobalClass.swift
//  TearDrops
//
//  Created by Venkatesh Mandapati on 18/04/18.
//  Copyright © 2018 Venky. All rights reserved.
//

import UIKit

class GlobalClass: NSObject {
    ///Returns the singleton instance of the DiscoverION.
    static let shared = GlobalClass()
    private override init() {}
    
    var selectionArray = [UIViewController]()
}

