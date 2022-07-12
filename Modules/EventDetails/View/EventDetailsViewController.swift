//
//  EventDetailsEventDetailsViewController.swift
//  TopEvent
//
//  Created by Vladislav Patrakov on 20/06/2022.
//  Copyright © 2022 OSinit. All rights reserved.
//

import UIKit

class EventDetailsViewController: UIViewController, EventDetailsViewInput {

    var output: EventDetailsViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: EventDetailsViewInput
    func setupInitialState() {
    }
}
