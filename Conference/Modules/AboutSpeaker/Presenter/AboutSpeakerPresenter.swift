//
//  AboutSpeakerAboutSpeakerPresenter.swift
//  TopEvent
//
//  Created by Vladislav Patrakov on 27/06/2022.
//  Copyright © 2022 OSinit. All rights reserved.
//

class AboutSpeakerPresenter: AboutSpeakerModuleInput, AboutSpeakerViewOutput, AboutSpeakerInteractorOutput {

    weak var view: AboutSpeakerViewInput!
    var interactor: AboutSpeakerInteractorInput!
    var router: AboutSpeakerRouterInput!
    
    private let showSpeakerId: String
    
    init(showSpeakerId: String) {
        self.showSpeakerId = showSpeakerId
    }

    func viewIsReady() {
        interactor.providingDataForDisplay(showSpeakerId: showSpeakerId)
    }
    
    func didRetrieveAboutSpeaker(speaker: Speaker) {
        view.setupInitialState(speaker: speaker)
    }
}
