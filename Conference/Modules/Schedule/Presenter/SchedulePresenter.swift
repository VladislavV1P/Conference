//
//  SchedulePresenter.swift
//  TopEvent
//
//  Created by Владислав Патраков on 24.05.2022.
//

import Foundation

class SchedulePresenter: ScheduleModuleInput, ScheduleViewOutput, ScheduleInteractorOutput, ScheduleTableViewCellOutput {
    
    weak var view: ScheduleViewInput!
    var interactor: ScheduleInteractorInput!
    var router: ScheduleRouterInput!
    
    func viewIsReady(screenIndex: Int) {
        interactor.retrieveEventsSchedule(screenIndex: screenIndex)
    }
    
    func didRetrieveEventsSchedule(_ events: [Event], nameOfConference: String, nameTagItemSegmentControl: [String]) {
        view.setupInitialState(with: events, nameOfConference: nameOfConference, nameTagItemSegmentControl: nameTagItemSegmentControl)
    }
    
    func updateEventsSchedule(_ events: [Event], nameOfConference: String, nameTagItemSegmentControl: [String]) {
        view.reloadInterface(with: events, nameOfConference: nameOfConference, nameTagItemSegmentControl: nameTagItemSegmentControl)
    }
    
    func filterScheduleByTag(indexNameItem: Int, screenIndex: Int) {
            self.interactor.providingDataForDisplay(
                indexNameItem: indexNameItem,
                screenIndex: screenIndex)
    }
    
    func addToFavorites(index: Int) {
        interactor.addToFavorites(index: index)
    }
    
    func passOnEventSelected(event: Event) {
        router.passOnEventSelected(event: event)
    }
    
    func loginToAccount(signIn: AuthorizationMethod){
        switch signIn {
        case .google:
            interactor.signGoogle()
        case .apple:
            interactor.signAppleID()
        }
        
    }
    
    func outAccount(){
        interactor.outAccount()
    }
    
    func login(completionHandler: @escaping (AuthorizationMethod) -> Void) {
        router.login() { authorizationMethod in
            completionHandler(authorizationMethod)
        }
    }
    
    func singOut(completionHandler: @escaping () -> Void) {
        router.singOut() {
            completionHandler()
        }
    }
}
