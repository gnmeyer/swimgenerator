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
    
    @Field(key: "distance")
    var distance: Int
    
    @Field(key: "rest")
    var rest: Int

    @OptionalParent(key: "set_id")
    var set: Set?

    init() { }

    init(id: UUID? = nil, title: String, distance: Int, rest: Int, set_id: UUID) {
        self.id = id
        self.title = title
        self.distance = distance
        self.rest = rest
        self.$set.id = set_id
    }
    
    func toDTO() -> StrokeDTO {
        .init(
            id: self.id,
            title: self.$title.value,
            distance: self.$distance.value,
            rest: self.$rest.value,
            set_id: self.$set.id
        )
    }
}

