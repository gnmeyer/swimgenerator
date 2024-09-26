//
//  StrokeDTO.swift
//  Workout
//
//  Created by Grant Meyer on 9/26/24.
//
import Fluent
import Vapor

struct StrokeDTO: Content {
    var id: UUID?
    var title: String?
    var distance: Int?
    var rest: Int?
    
    func toModel() -> Stroke {
        let model = Stroke()
        
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
        return model
    }
}
