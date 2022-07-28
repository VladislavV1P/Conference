//
//  EventDetailsEventDetailsPresenter.swift
//  TopEvent
//
//  Created by Vladislav Patrakov on 20/06/2022.
//  Copyright © 2022 OSinit. All rights reserved.
//

class EventDetailsPresenter: EventDetailsModuleInput, EventDetailsViewOutput, EventDetailsInteractorOutput {

    weak var view: EventDetailsViewInput!
    var interactor: EventDetailsInteractorInput!
    var router: EventDetailsRouterInput!
    
    private let showEventId: String
    
    init(showEventId: String) {
        self.showEventId = showEventId
    }
    
    func viewIsReady() {
        interactor.providingDataForDisplay(showEventId: showEventId)
    }
    
    func didRetrieveEventDetails(event: Event) {
        view.setupInitialState(event: event)
    }
    
    func passOnSpeakerSelected(showSpeakerID: String){
        router.passOnSpeakerSelected(showSpeakerID: showSpeakerID)
    }
}
