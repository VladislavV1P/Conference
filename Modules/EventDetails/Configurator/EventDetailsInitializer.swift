//
//  EventDetailsEventDetailsInitializer.swift
//  TopEvent
//
//  Created by Vladislav Patrakov on 20/06/2022.
//  Copyright © 2022 OSinit. All rights reserved.
//

import UIKit

class EventDetailsModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var eventdetailsViewController: EventDetailsViewController!

    override func awakeFromNib() {

        let configurator = EventDetailsModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: eventdetailsViewController)
    }

}
