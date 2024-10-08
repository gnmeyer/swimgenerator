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
    
    func toModel() -> Stroke {
        let model = Stroke()
        
        model.id = self.id
        if let title = self.title {
            model.title = title
        }
        return model
    }
}
