//
//  EventDetailsEventDetailsInteractor.swift
//  TopEvent
//
//  Created by Vladislav Patrakov on 20/06/2022.
//  Copyright © 2022 OSinit. All rights reserved.
//

class EventDetailsInteractor: EventDetailsInteractorInput {
    
    weak var output: EventDetailsInteractorOutput!
    var eventStorageService: EventStorageServiceProtocol!
    
    func providingDataForDisplay(showEventId: String) {
        getShowEventDetails(for: showEventId) { [weak self] event in
            guard let self = self else {return}
            let showEvent = event
            self.output.didRetrieveEventDetails(event: showEvent)
        }
    }
    
    private func getShowEventDetails(for showEventId: String, completionHandler: @escaping(Event) -> Void){
        let events = eventStorageService.getScheduledEvents()
        if let showEvent = events.first(where: { $0.id == showEventId}) {
            completionHandler(showEvent)
        }
    }
}
