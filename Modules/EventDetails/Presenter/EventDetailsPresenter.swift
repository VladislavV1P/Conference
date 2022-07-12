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

    func viewIsReady() {

    }
}
