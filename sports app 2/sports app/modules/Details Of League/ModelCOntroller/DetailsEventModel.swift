//
//  DetailsEventModel.swift
//  sports app
//
//  Created by Macintosh on 22/06/2022.
//

import Foundation



class EventDetailsController : IEventModel {
   
    
    
    let apiEventService : ApiServicesOfEvents = EventNetworkMangerInDetail()
    let eventPresenter : IEventPresenter
    
    init(eventPresenter : IEventPresenter){
        self.eventPresenter = eventPresenter
    }
    func fetchDataOfEventsFromApi(endPoint: String) {
        apiEventService.fetchDataOfEvents(endPoint: endPoint) { events, error in
            if let events = events {
                self.eventPresenter.onSuccessEvents(events: events)
            }else {
                self.eventPresenter.onFailedEvents(error: error as! Error)
            }
        }
    }
}
