//
//  AboutSpeakerAboutSpeakerInteractorOutput.swift
//  TopEvent
//
//  Created by Vladislav Patrakov on 27/06/2022.
//  Copyright © 2022 OSinit. All rights reserved.
//

import Foundation

protocol AboutSpeakerInteractorOutput: AnyObject {
    func didRetrieveAboutSpeaker(speaker: Speaker)
}
