//
//  ScheduleInteractor.swift
//  TopEvent
//
//  Created by Владислав Патраков on 24.05.2022.
//

import Foundation

class ScheduleInteractor: ScheduleInteractorInput {
    
    private enum Constants {
        static let firstNameTagItemSegmentControl: String = "All"
        static let indexAllTagItemSegmentControl: Int = 0
    }
    
    private enum Display: Int {
        case main = 0
        case favourites
    }
    
    weak var output: ScheduleInteractorOutput!
    var eventStorageService: EventStorageServiceProtocol!
    var eventScheduleFromServer: EventScheduleServiceProtocol!
    var authProvider: UserAuthenticationRequirements!
    private var eventsScheduleDisplay = [Event]()
    private var eventsScheduleFavorite = [Event]()
    private var indexNameSegmentController: Int?
    private var screenIndexNow: Int?
    
    func retrieveEventsSchedule(screenIndex: Int) {
        getEventsScheduleDisplay { [weak self] eventDisplay , nameOfConference in
            guard let self = self else {return}
            let nameTagItemSegmentControl = self.createNameTagItemSegmentControl(scheduleEvent: eventDisplay)
            let event = self.checkingDisplayedEvents(
                screenIndex: screenIndex,
                event: eventDisplay)
            self.eventsScheduleFavorite = event
            self.eventStorageService.saveEvent(event: event)
            self.output.didRetrieveEventsSchedule(
                event,
                nameOfConference: nameOfConference,
                nameTagItemSegmentControl: nameTagItemSegmentControl)
        }
    }
    
    func providingDataForDisplay(indexNameItem: Int, screenIndex: Int) {
        indexNameSegmentController = indexNameItem
        
        if indexNameItem == Constants.indexAllTagItemSegmentControl {
            retrieveEventsSchedule(screenIndex: screenIndex)
        } else {
            getEventsScheduleDisplay { [weak self] event, nameOfConference in
                guard let self = self else {return}
                let nameTagItemSegmentControl = self.createNameTagItemSegmentControl(scheduleEvent: event)
                guard let nameTagItem = nameTagItemSegmentControl[optional: indexNameItem] else {return}
                let eventDisplay = event.filter { $0.tags == nameTagItem}
                let event = self.checkingDisplayedEvents(
                    screenIndex: screenIndex,
                    event: eventDisplay)
                self.eventsScheduleFavorite = event
                self.output.updateEventsSchedule(event, nameOfConference: nameOfConference, nameTagItemSegmentControl: nameTagItemSegmentControl)
            }
        }
    }
    
    private func checkingDisplayedEvents(screenIndex: Int, event: [Event]) -> [Event] {
        let eventFavorite = event.filter { $0.favoriteStatus }
        self.screenIndexNow = screenIndex
        guard let display = Display(rawValue: screenIndex) else { return [] }
        switch display {
        case .main:
            return event
        case .favourites:
            return eventFavorite
        }
    }
    
    private func createNameTagItemSegmentControl(scheduleEvent: [Event]) -> [String] {
        var nameTagItemSegmentControl = Array(Set(scheduleEvent.map({ item in
            item.tags
        }))).sorted()
        nameTagItemSegmentControl.insert(Constants.firstNameTagItemSegmentControl, at: 0)
        
        return nameTagItemSegmentControl
    }
    
    
    func addToFavorites(index: Int) {
        getEventsScheduleDisplay { [weak self] eventDisplay, _ in
            guard let self = self else {return}
            let event = self.eventsScheduleFavorite
            guard let eventExist = event[optional: index] else {return}
            var selectEvent = eventExist
            selectEvent.favoriteStatus.toggle()
            let eventSave = eventDisplay.map { eventItem -> Event in
                if eventItem.id == selectEvent.id {
                    
                    return selectEvent
                }

                return eventItem
            }
            self.eventStorageService.saveEvent(event: eventSave)
            if self.indexNameSegmentController == nil {
                self.indexNameSegmentController = Constants.indexAllTagItemSegmentControl
            }
            guard let indexSegment = self.indexNameSegmentController,
                  let indexScreen = self.screenIndexNow else {return}
            self.providingDataForDisplay(
                indexNameItem: indexSegment,
                screenIndex: indexScreen)
        }
    }
    
    private func getEventsScheduleDisplay(completionHandler: @escaping([Event], String) -> Void) {
        eventScheduleFromServer.getData { [weak self] event, nameOfConference in
            guard let self = self else {return}
            let eventsFavorite = self.eventStorageService.getScheduledEvents()
            self.eventsScheduleDisplay = event.map({ event -> Event in
                var item = event
                if let eventFavoriteStatus = eventsFavorite.first(where: { $0.id == event.id }) {
                    item.favoriteStatus = eventFavoriteStatus.favoriteStatus
                }
                
                return item
            })
            let eventDisplay = self.eventsScheduleDisplay
            completionHandler(eventDisplay, nameOfConference)
        }
    }
    
    func signGoogle(){
        authProvider.signGoogle()
    }
    
    func signAppleID(){
        authProvider.signAppleID()
    }
    
    func outAccount(){
        authProvider.outAccount()
    }
}
