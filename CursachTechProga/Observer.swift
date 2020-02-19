//
//  Observer.swift
//  cursovayaTechProg
//
//  Created by Артем Шарапов on 17.02.2020.
//  Copyright © 2020 Артем Шарапов. All rights reserved.
//

import Foundation

protocol Observer {
    //Разобраться с возвращаемым типом
    func update(State:Issue)->Bool
}
