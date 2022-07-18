//
//  EventCoreDataStore.swift
//  TopEvent
//
//  Created by Владислав Патраков on 27.05.2022.
//

import Foundation
import CoreData
import UIKit

class EventStorageService: EventStorageServiceProtocol {
    
    private enum Constants {
        static let entityEvent = "EventModel"
        static let entitySpeaker = "SpeakerModel"
        static let errorFetch = "Could not fetch."
        static let errorSave = "Failed to saving test data:"
        static let dataUnavailable = "Unknown parameter"
    }
    
    private func declarationСontext() -> NSManagedObjectContext?{
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return nil}
        let context = appDelegate.persistentContainer.viewContext
        return context
    }
    
    private func saveEventData(data: Event) {
        guard let context = declarationСontext() else { return }
        
        guard let saveData = NSEntityDescription.entity(
            forEntityName: Constants.entityEvent,
            in: context) else {return}
        guard let saveSpeakerData = NSEntityDescription.entity(
            forEntityName: Constants.entitySpeaker,
            in: context) else {return}
        
        let speakers = createSpeakersSet(data: data, saveSpeakerData: saveSpeakerData, context: context) as NSSet
        
        let eventData = EventModel(entity: saveData, insertInto: context)
        eventData.id = data.id
        eventData.url = data.url
        eventData.title = data.title
        eventData.detail = data.detail
        eventData.location = data.location
        eventData.addToSpeakers(speakers)
        eventData.startDate = data.startDate
        eventData.favoriteStatus = data.favoriteStatus
        
        do {
            try context.save()
        } catch {
            print("\(Constants.errorSave)  \(error)")
        }
    }
    
    private  func createSpeakersSet(data: Event, saveSpeakerData: NSEntityDescription, context: NSManagedObjectContext) -> Set<SpeakerModel> {
        let speakersList = data.speakers.map({ data -> SpeakerModel in
            let speakerData = SpeakerModel(entity: saveSpeakerData, insertInto: context)
            speakerData.id = data.id
            speakerData.fullName = data.fullName
            speakerData.thumbnailURL = data.thumbnailURL
            speakerData.specialization = data.specialization
            speakerData.contactInformation = data.contactInformation
            speakerData.technicalSkills = data.technicalSkills
            
            return speakerData
        })
        let speakers = Set(speakersList)
        
        return speakers
    }
    
    func saveEvent(event: [Event]) {
        deleteData()
        event.forEach { item in
            saveEventData(data: item)
        }
    }
    
    func getScheduledEvents() -> [Event] {
        guard let context = declarationСontext() else { return []}
        let fetchRequest: NSFetchRequest<EventModel> = EventModel.fetchRequest()
        
        do {
            let eventData = try context.fetch(fetchRequest)
            guard !eventData.isEmpty else {return []}
            let events = eventData.map({ item in
                Event(
                    id: item.id,
                    url: item.url,
                    title: item.title,
                    detail: item.detail,
                    location: item.location,
                    speakers: item.speakers.allObjects.map { speaker -> Speaker in
                        let setSpeaker = Speaker(
                            id: ((speaker as AnyObject).id ?? Constants.dataUnavailable),
                            fullName: (speaker as AnyObject).fullName ?? Constants.dataUnavailable,
                            thumbnailURL: (speaker as AnyObject).thumbnailURL ?? Constants.dataUnavailable,
                            specialization: (speaker as AnyObject).specialization ?? Constants.dataUnavailable,
                            contactInformation: (speaker as AnyObject).contactInformation ?? Constants.dataUnavailable,
                            technicalSkills: (speaker as AnyObject).technicalSkills ?? Constants.dataUnavailable)
                        
                        return setSpeaker
                    },
                    startDate: item.startDate,
                    tags: item.tags,
                    favoriteStatus: item.favoriteStatus)
            })
            
            return events
        } catch {
            print("\(Constants.errorFetch) \(error)")
        }
        return []
    }
    
    private func deleteItemsModel<ModelData>(model: [ModelData]?, context: NSManagedObjectContext){
        model?.forEach({ object in
            context.delete(object as! NSManagedObject)
        })
    }
    
    private func deleteData() {
        guard let context = declarationСontext() else { return }
        let fetchRequest: NSFetchRequest<EventModel> = EventModel.fetchRequest()
        let eventData = try? context.fetch(fetchRequest)
        deleteItemsModel(model: eventData, context: context)
        
        do {
            try context.save()
        } catch {
            print(error)
        }
    }
}
