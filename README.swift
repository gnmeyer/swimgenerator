//
//  README.swift
//  Workout
//
//  Created by Grant Meyer on 9/26/24.
//

Workout {
    title: Simple Workout
    distance: 1000
//    intensity:
//    duration:
    Sets [
        Set {
            title: Warmup
            distance: 200
//            intensity: 1
            rest: 15
            reps: 2
            Strokes [
                Stroke {
                    title: "Freestyle"
                    duration: 50
                    rest: 15
                }
                Stroke {
                    title: "Backstroke"
                    duration: 50
                    rest: 15
                }
            ]
        }
        
        Set {
            title: Main
            distance: 600
//            intensity: 1
            rest: 15
            reps: 2
            Strokes [
                Stroke {
                    title: "Freestyle"
                    duration: 150
                    rest: 15
                }
                Stroke {
                    title: "Backstroke"
                    duration: 150
                    rest: 15
                }
            ]
        }
        
        Set {
            title: Cooldown
            distance: 200
//            intensity: 1
            rest: 15
            reps: 2
            Strokes [
                Stroke {
                    title: "Kick"
                    duration: 200
                    rest: 15
                }
            ]
        }
    
    ]

}
