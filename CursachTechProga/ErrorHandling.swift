//
//  ErrorHandling.swift
//  CursachTechProga
//
//  Created by Артем Шарапов on 24.02.2020.
//  Copyright © 2020 Artem Feklistov. All rights reserved.
//

import Foundation

enum JournalError : Error {
    case noSubscribers
    case observersUpdateError
}

enum FileError : Error {
    case troublesWithContentOfFile
}
