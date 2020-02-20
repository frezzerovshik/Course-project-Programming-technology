//
//  Subject.swift
//  cursovayaTechProg
//
//  Created by Артем Шарапов on 17.02.2020.
//  Copyright © 2020 Артем Шарапов. All rights reserved.
//

import Foundation
protocol Subject {
    var Observers: [Observer] {get set}
    func register(NewObserver : Observer) throws -> Void
    func delete(SomeObserverWithId : Int) throws -> Void
    func notifyObservers(WithNewIssue: Issue) throws -> Void
    func getLastObserverNum() -> Int
}
