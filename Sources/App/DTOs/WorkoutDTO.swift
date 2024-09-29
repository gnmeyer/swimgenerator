//
//  WorkoutDTO.swift
//  Workout
//
//  Created by Grant Meyer on 9/25/24.
//

import Fluent
import Vapor

struct WorkoutDTO: Content {
    var id: UUID?
    var title: String
    var distance: Int
    
    func toModel() -> Workout {
        let model = Workout()
        
        model.id = self.id
        // if let title = self.title {
            model.title = title
        // }
        
        // if let distance = self.distance {
            model.distance = distance
        // }
        return model
    }
}
