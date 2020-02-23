//
//  Subject.swift
//  cursovayaTechProg
//
//  Created by Артем Шарапов on 17.02.2020.
//  Copyright © 2020 Артем Шарапов. All rights reserved.
//

import Foundation

internal protocol Subject {
    
    var Observers: [Observer] { get set }
    
    func register(NewObserver: Observer) throws
    
    func delete(SomeObserverWithId: Int) throws
    
    func notifyObservers(WithNewIssue: Issue) throws
    
    func getLastObserverNum() -> Int
}
