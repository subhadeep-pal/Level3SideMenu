//
//  Modal.swift
//  CollapsingTableView
//
//  Created by Subhadeep Pal on 19/08/17.
//  Copyright © 2017 Subhadeep Pal. All rights reserved.
//

import UIKit

class Modal: NSObject {
    
    var name: String
    var isExpanded : Bool = false
    
    var subMenu : [Modal]
    
    init(name: String, subMenu: [Modal]) {
        self.name = name
        self.subMenu = subMenu
    }

}
