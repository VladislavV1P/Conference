//
//  AboutSpeakerAboutSpeakerInteractor.swift
//  TopEvent
//
//  Created by Vladislav Patrakov on 13/07/2022.
//  Copyright © 2022 OSinit. All rights reserved.
//

class AboutSpeakerInteractor: AboutSpeakerInteractorInput {
    
    weak var output: AboutSpeakerInteractorOutput!
    var eventStorageService: EventStorageServiceProtocol!
    
    func providingDataForDisplay(showSpeakerId: String) {
        getShowAboutSpeaker(for: showSpeakerId) { [weak self] speaker in
            guard let self = self else {return}
            let showSpeaker = speaker
            self.output.didRetrieveAboutSpeaker(speaker: showSpeaker)
        }
    }
    
    private func getShowAboutSpeaker(for showSpeakerId: String, completionHandler: @escaping(Speaker) -> Void){
        let events = eventStorageService.getScheduledEvents()
        if let speaker = events.compactMap({ event in
            event.speakers.first { speaker in
                speaker.id == showSpeakerId
            }
        }).first {
            completionHandler(speaker)
        }
    }
}
