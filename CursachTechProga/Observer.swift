//
//  Observer.swift
//  cursovayaTechProg
//
//  Created by Артем Шарапов on 17.02.2020.
//  Copyright © 2020 Артем Шарапов. All rights reserved.
//

import Foundation

internal protocol Observer {
    
    func update(State: Issue) -> Bool
}

