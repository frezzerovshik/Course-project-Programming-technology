//
//  Journal.swift
//  cursovayaTechProg
//
//  Created by Артем Шарапов on 17.02.2020.
//  Copyright © 2020 Артем Шарапов. All rights reserved.
//

import Foundation
protocol Journal:Subject {
    var issuesList : [Issue] {set get}
}
