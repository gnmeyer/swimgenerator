//
//  SetDTO.swift
//  Workout
//
//  Created by Grant Meyer on 9/26/24.
//

import Fluent
import Vapor

struct SwimSetDTO: Content {
    var id: UUID?
    var title: String?
    var distance: Int?
    var rest: Int?
    var reps: Int?
    var stroke_ids: [UUID]?

    func toModel() -> SwimSet {

        let model = SwimSet()
        
        model.id = self.id
        if let title = self.title {
            model.title = title
        }
        if let distance = self.distance {
            model.distance = distance
        }
        if let rest = self.rest {
            model.rest = rest
        }
        if let reps = self.reps {
            model.reps = reps
        }

        if let stroke_ids = self.stroke_ids {
            model.stroke_ids = stroke_ids
        }
        
        return model
    }
}
