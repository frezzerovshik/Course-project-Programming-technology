//
//  Subject.swift
//  cursovayaTechProg
//
//  Created by Артем Шарапов on 17.02.2020.
//  Copyright © 2020 Артем Шарапов. All rights reserved.
//

import Foundation
protocol Subject {
    static var Observers: [Observer] {get set}
    static func register(NewObserver : Observer) throws -> Void
    static func delete(SomeObserverWithId : Int) throws -> Void
    static func notifyObservers(WithNewIssue: Issue) throws -> Void
    static func getLastObserverNum() -> Int
}
