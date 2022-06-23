//
//  presenterInDetailsEvent.swift
//  sports app
//
//  Created by Macintosh on 22/06/2022.
//

import Foundation


class PresenterInEventDetails : IEventPresenter {
    
    let eventsView : IEventView
    init(eventsView : IEventView)
    {
        self.eventsView = eventsView
    }
    
    
    
    
    func fetchdataOfEvents(endPoint: String) {
        let homeEventsView = EventDetailsController(eventPresenter: self)
        homeEventsView.fetchDataOfEventsFromApi(endPoint: endPoint)
    }
    
    func onSuccessEvents(events: [Event]) {
        eventsView.renderEvents(events: events)
    }
    
    func onFailedEvents(error: Error) {
        eventsView.postErrorInEvents(error: error)
    }
    
    
    
    
    
    
}
