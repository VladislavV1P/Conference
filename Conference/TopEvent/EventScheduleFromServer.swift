//
//  TestData.swift
//  TopEvent
//
//  Created by Владислав Патраков on 27.05.2022.
//

import Foundation

import Alamofire

class EventScheduleFromServer: EventScheduleServiceProtocol {
    
    private enum Constants {
        static let url = "https://virtserver.swaggerhub.com/VladislavV1P/Schedule/1.0.0/schedule"
    }
    
    static let shared = EventScheduleFromServer()
    
    func getData(completionHandler: @escaping([Event], String) -> Void) {
        let url = URL(string: Constants.url)
        guard let url = url else {return}
        requestData(url: url) { events, nameOfConference in
            completionHandler(events, nameOfConference)
        }
    }
    
    private func requestData(url: URL, completionHandler: @escaping([Event], String) -> Void) {
        AF.request(
            url,
            method: .get,
            encoding: JSONEncoding.default)
        .responseDecodable(of: ScheduleResponse.self) { [weak self] response in
            guard let self = self,
                  let extractedResult = try? response.result.get() else { return }
            let nameOfConference = extractedResult.nameOfConference
            let eventResponse = extractedResult.schedule
            self.convertResponseToScheduleEvents(
                eventResponse: eventResponse) { events in
                completionHandler(events, nameOfConference)
            }
        }
    }
    
    private func convertResponseToScheduleEvents(eventResponse: [EventResponse], completionHandler: @escaping([Event]) -> Void) {
        var events = [Event]()
        var speakers = [Speaker]()
        events = eventResponse.map({ event in
            speakers = event.speakers.map({ speaker in
                Speaker(
                    id: speaker.id,
                    fullName: speaker.fullName,
                    thumbnailURL: speaker.thumbnailURL,
                    specialization: speaker.specialization,
                    contactInformation: speaker.contactInformation,
                    technicalSkills: speaker.technicalSkills)
            })
            let schedule = Event(
                id: event.id,
                url: event.url,
                title: event.title,
                detail: event.detail,
                location: event.location,
                speakers: speakers,
                startDate: event
                    .startDate
                    .stringToDateConverter(
                        dateFormatter: FormattingUtils.dateFormatter),
                tags: event.tags)
            return schedule
        })
        completionHandler(events)
    }
}
