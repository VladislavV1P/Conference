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
    
    func passAuthorization(from view: ScheduleViewInput) {
        router.passAuthorization(from: view)
    }
    
    func signGoogle(){
        interactor.signGoogle()
    }
    
    func outAccount(){
        interactor.outAccount()
    }
    
    func login(completionHandler: @escaping () -> Void) {
        router.login() {
            completionHandler()
        }
    }
    
    func singOut(completionHandler: @escaping () -> Void) {
        router.singOut() {
            completionHandler()
        }
    }
}
