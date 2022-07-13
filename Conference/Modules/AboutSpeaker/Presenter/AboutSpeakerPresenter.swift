//
//  AboutSpeakerAboutSpeakerPresenter.swift
//  TopEvent
//
//  Created by Vladislav Patrakov on 13/07/2022.
//  Copyright © 2022 OSinit. All rights reserved.
//

class AboutSpeakerPresenter: AboutSpeakerModuleInput, AboutSpeakerViewOutput, AboutSpeakerInteractorOutput {

    weak var view: AboutSpeakerViewInput!
    var interactor: AboutSpeakerInteractorInput!
    var router: AboutSpeakerRouterInput!

    func viewIsReady() {

    }
}
