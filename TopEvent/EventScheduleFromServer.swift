//
//  TestData.swift
//  TopEvent
//
//  Created by Владислав Патраков on 27.05.2022.
//

import Foundation

// временное решение, позже данные буду создавать в swagger
class EventScheduleFromServer: EventScheduleFromServerInput {
    
    static let shared = EventScheduleFromServer()
    
    func getData(completionHandler: @escaping([Event], String) -> Void) {
        completionHandler(testData, testNameOfConference)
    }
    
    func setData(){
        
    }
    
    // TODO: заменить на получение данных используя swagger
    var testData = [Event(id: "122", url: "",
                          title: "Знакомство с Xcode",
                          detail: "Изучение программирования на языке Swift мы начнем со среды раз-работки Xcode. ... Xcode — это IDE, то есть среда создания приложений для iOS и OS X. Xcode — это наиболее важный инструмент, который использует разработчик.",
                          location: "Москва",
                          speakers: [
                            Speaker(id: "2", fullName: "Патраков Владислав Вадимович", thumbnailURL: "", specialization: "", contactInformation: "", technicalSkills: ""),
                            Speaker(id: "3", fullName: "Patrakov Vladislav Vadimovich", thumbnailURL: "", specialization: "", contactInformation: "", technicalSkills: "")],
                          startDate: Date(),
                          tags: "iOS"),
                    Event(id: "123", url: "",
                          title: "Особенности Swift",
                          detail: "Swift - это универсальный, многопарадигмальный, скомпилированный язык программирования , разработанный Apple Inc. и сообществом с открытым исходным кодом. Впервые выпущенный в 2014 году Swift был разработан как замена более раннего языка программирования Apple Objective-C, поскольку Objective-C практически не изменился с начала 1980-х годов и не имел современных языковых функций.",
                          location: "Казань",
                          speakers: [Speaker(id: "1", fullName: "Патраков Владислав Вадимович", thumbnailURL: "", specialization: "", contactInformation: "", technicalSkills: "")],
                          startDate: Date(),
                          tags: "iOS"),
                    Event(id: "124", url: "",
                          title: "Работа с сетью",
                          detail: "Первое – это трафик. Не всегда есть возможность работать по бесплатному Wi-Fi-соединению, а мобильный интернет всё еще дорогой, и об этом нужно помнить, потому что трафик – это деньги пользователя.",
                          location: "Казань",
                          speakers: [Speaker(id: "1", fullName: "Патраков Владислав Вадимович", thumbnailURL: "", specialization: "", contactInformation: "", technicalSkills: "")],
                          startDate: Date(),
                          tags: "iOS"),
                        Event(id: "125", url: "",
                              title: "Введение в Android",
                              detail: "Первое – это трафик. Не всегда есть возможность работать по бесплатному Wi-Fi-соединению, а мобильный интернет всё еще дорогой, и об этом нужно помнить, потому что трафик – это деньги пользователя.",
                              location: "Казань",
                              speakers: [Speaker(id: "1", fullName: "Патраков Владислав Вадимович", thumbnailURL: "", specialization: "", contactInformation: "", technicalSkills: "")],
                              startDate: Date(),
                              tags: "Android"),
                        Event(id: "126", url: "",
                              title: "MVVM, LiveData, Короутины, Retrofit",
                              detail: "Первое – это трафик. Не всегда есть возможность работать по бесплатному Wi-Fi-соединению, а мобильный интернет всё еще дорогой, и об этом нужно помнить, потому что трафик – это деньги пользователя.",
                              location: "Казань",
                              speakers: [Speaker(id: "1", fullName: "Патраков Владислав Вадимович", thumbnailURL: "", specialization: "", contactInformation: "", technicalSkills: "")],
                              startDate: Date(),
                              tags: "Android"),
                        Event(id: "127", url: "",
                              title: "Room, Repository/Gateway",
                              detail: "Первое – это трафик. Не всегда есть возможность работать по бесплатному Wi-Fi-соединению, а мобильный интернет всё еще дорогой, и об этом нужно помнить, потому что трафик – это деньги пользователя.",
                              location: "Казань",
                              speakers: [Speaker(id: "1", fullName: "Патраков Владислав Вадимович", thumbnailURL: "", specialization: "", contactInformation: "", technicalSkills: "")],
                              startDate: Date(),
                              tags: "Android")]
    
    // TODO: заменить на получение данных используя swagger
    var testNameOfConference = "Online конференция OSinit 2022 "
}
