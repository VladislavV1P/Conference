//
//  EventDetailsEventDetailsRouter.swift
//  TopEvent
//
//  Created by Vladislav Patrakov on 20/06/2022.
//  Copyright © 2022 OSinit. All rights reserved.
//

import UIKit

class EventDetailsRouter: EventDetailsRouterInput {
    
    private enum Constants {
        static let nameUIStoryboard: String = "Main"
        static let identifierIDEventDetails: String = "AboutSpeaker"
    }
    
    var view: UIViewController
    
    init(view: UIViewController){
        self.view = view
    }
    
    func passOnSpeakerSelected(showSpeakerID: String){
        let storyboard = UIStoryboard(
            name: Constants.nameUIStoryboard,
            bundle: nil)
        if let vc = storyboard
            .instantiateViewController(
                withIdentifier: Constants
                    .identifierIDEventDetails) as? AboutSpeakerViewController {
            
            view.navigationController?
                .pushViewController(
                    vc,
                    animated: true)
            let aboutSpeakerModuleInitializer = AboutSpeakerModuleInitializer()
            aboutSpeakerModuleInitializer.setupAboutSpeakerModuleConfigurator(
                view: vc,
                showSpeakerId: showSpeakerID)
        }
    }
}
