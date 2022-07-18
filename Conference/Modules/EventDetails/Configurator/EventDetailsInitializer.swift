//
//  EventDetailsEventDetailsInitializer.swift
//  TopEvent
//
//  Created by Vladislav Patrakov on 20/06/2022.
//  Copyright © 2022 OSinit. All rights reserved.
//

import UIKit

class EventDetailsModuleInitializer {
    
    func setupEventDetailsModuleConfigurator(view: UIViewController, showEventId: String){
            let configurator = EventDetailsModuleConfigurator()
        configurator.configureModuleForViewInput(
            viewInput: view,
            showEventId: showEventId)
    }
}
