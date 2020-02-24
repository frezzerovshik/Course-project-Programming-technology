//
//  Journal.swift
//  cursovayaTechProg
//
//  Created by Артем Шарапов on 17.02.2020.
//  Copyright © 2020 Артем Шарапов. All rights reserved.
//

import Foundation
class Journal : Subject {
    
    var contentOfFile = String()
    
    var issuesList: [Issue] = [Issue()]// Список выпусков
    
    var Observers: [Observer] = [] // Список наблюдателей
    
    var path : String = String()
    
    func register(NewObserver: Observer) {  // Добавление наблюдателя
        var tempObserver = NewObserver
        tempObserver.Id = Observers.count
        Observers.append(tempObserver)
    }
    
    func delete(SomeObserver : Observer) throws {  // Удаление наблюдателя
        var wasFound : Bool = false
        if Observers.isEmpty == false {
            for observer in Observers {
                if observer.Id == SomeObserver.Id {
                    Observers.remove(at: observer.Id)
                    wasFound = true
                }
            }
            if wasFound == false{
                print("Подписчик с указанным ID отсутствует")
            }
        }
        else {
            throw JournalError.noSubscribers
        }
    }
    
    func notifyObservers(WithNewIssue :Issue) throws {
        if Observers.isEmpty == false {
            for everyone in Observers {
                if everyone.update(State : WithNewIssue) == false {
                   throw JournalError.observersUpdateError
                }
            }
        }
        else {
            throw JournalError.noSubscribers
        }
    }
    
    func checkFile() {
        var updatedContent : String?
        do{
            updatedContent = try String(contentsOfFile: path , encoding: .utf8)
        }
        catch let error as NSError{
            print("Some trouble: class TopGear , method checkFile() : \(error)")
        }
        if let dataToCheck = updatedContent {
            if dataToCheck != contentOfFile {
                contentOfFile = dataToCheck
                let sizeBeforeUpdate = issuesList.count
                issuesList.removeAll()
                do{
                    issuesList = try makeIssues(content: contentOfFile)
                }
                catch FileError.troublesWithContentOfFile {
                    print("Файл заполнен некорректно!")
                }
                catch {
                    print("Возникла непредвиденная ошибка!")
                }
                for i in sizeBeforeUpdate ..< issuesList.count{
                    do{
                        try notifyObservers(WithNewIssue: issuesList[i])
                        print("Оповещения успешно отправлены")
                    }
                    catch JournalError.observersUpdateError {
                        print("Возникла ошибка при обновлении данных у подписчиков")
                    }
                    catch JournalError.noSubscribers{
                        print("Ошибка - нет ни одного подписчика")
                    }
                    catch {
                        print("Возникла непредвиденная ошибка")
                    }
                }
            }
        }
        else {
            print("Что-то пошло не так при попытке обратиться к файлу!")
        }
    }
    
    func getLastObserverNum() -> Int {
        return Observers.count-1
    }
}
