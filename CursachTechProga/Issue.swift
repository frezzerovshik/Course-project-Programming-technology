//
//  issue.swift
//  cursovayaTechProg
//
//  Created by Артем Шарапов on 17.02.2020.
//  Copyright © 2020 Артем Шарапов. All rights reserved.
//

import Foundation

class Issue{
    var nameOfJournal : String
    var releaseDate : String
    var number: String
    var issueTopic: String
    init(nameOfJournalInit : String , releaseDateInit : String , numberInit : String , issueTopicInit : String){
        self.releaseDate = releaseDateInit
        self.number = numberInit
        self.issueTopic = issueTopicInit
        self.nameOfJournal = nameOfJournalInit
    }
}
