//
//  Stroke.swift
//  Workout
//
//  Created by Grant Meyer on 9/26/24.
//

import Fluent
import struct Foundation.UUID

final class Stroke: Model, @unchecked Sendable {
    static let schema = "strokes"
    
    @ID(key: .id)
    var id: UUID?

    @Field(key: "title")
    var title: String

    init() { }

    // init(id: UUID? = nil, title: String, distance: Int, rest: Int, set_id: UUID) {
    init(id: UUID? = nil, title: String) {
        self.id = id
        self.title = title
    }
    
    func toDTO() -> StrokeDTO {
        .init(
            id: self.id,
            title: self.$title.value
        )
    }
}

