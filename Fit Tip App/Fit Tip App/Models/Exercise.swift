//
//  Exercise.swift
//  Fit Tip App
//
//  Created by Atheer Othman on 23/04/1443 AH.
//

import UIKit

struct Exercise {
    
    let exeType: String
    let exeName: String
    let exeDesc: String
    let exeVideo: String
}

var exercises = [Exercise(exeType: "Cardio",
                          exeName: "Fast feet side front side",
                          exeDesc: """
                                    3 rounds / 30 seconds.

                                    Important notes:
                                    - Abdominal muscles taut without muting the breath.
                                    - The back is straight and the head is forward.
                                    - The feet are wide apart and the heels do not touch the ground during the exercise.
                                    - The knees do not go beyond the level of the front legs.
                                    - Inhale through the nose and exhale through the mouth regularly and calmly.
                                    - Commit to the required exercise period.
                                    """,
                          exeVideo:"qe0ZcMLOqsY"),
                 Exercise(exeType: "Belly",
                          exeName: "Crunches",
                          exeDesc: """
                                    3 rounds / 25 times

                                    Important notes:
                                    - Hands behind the ear..
                                    - Feet are fixed on the ground.
                                    - Lift the upper back.
                                    - Inhale through the nose when lifting.
                                    - Exhale from the mouth when descending.
                                    """,
                          exeVideo:"HX4kZyDAVyE"),
                 Exercise(exeType: "Arm",
                          exeName: "Arm Circles",
                          exeDesc: """
                                    1 round / 15 times

                                    Important Notes:
                                    - The back is straight.
                                    - Touch the thigh at the start of each cycle.
                                    - Move the right hand the required number of times, forward and then backward, and then the left hand in the same way and thus counts a round.
                                    - Don't hold your breath.
                                    - Inhale through the nose and exhale through the mouth.
                                    """,
                          exeVideo:"qRwBGr3FYr8"),
                 Exercise(exeType: "Legs",
                          exeName: "Wall Sit",
                          exeDesc: """
                                    1 rounds/1 minute

                                    Important Notes:
                                    - The back is straight.
                                    - Head, shoulder and back fixed to the wall.
                                    - Thighs straight and parallel.
                                    - Knees at heel level.
                                    - Hold this position for the required number of seconds.
                                    - Breathe calmly and regularly, and do not hold your breath.
                                    """,
                          exeVideo:"cdph8hv0O0"),
                 Exercise(exeType: "Back",
                          exeName: "Bent over rowing both arms",
                          exeDesc: """
                                    3 rounds / 15 times

                                    Important Notes:
                                    - Abdominal muscles tightened without holding a breath.
                                    - The back is straight.
                                    - The head is at the level of the back.
                                    - The knees are bent and do not go beyond the front of the legs.
                                    - Breathe calmly and regularly, and do not hold your breath.
                                    """,
                          exeVideo:"ApZeGqJveiw"),
                 Exercise(exeType: "Chest",
                          exeName: "Push ups kneeling",
                          exeDesc: """
                                    3 rounds / 7 times

                                    Important Notes:
                                    - Abdominal muscles, legs and buttocks tightened.
                                    - Leg, thigh and back straight unit.
                                    - Inhale through the nose when descending.
                                    - Exhale from the mouth when lifting
                                    """,
                          exeVideo:"rdKLJUgLu2Q"),
                 Exercise(exeType: "Shoulder",
                          exeName: "Shoulder lateral rotation weight",
                          exeDesc: """
                                    1 round / 15 times

                                    Important Notes:
                                    - Abdominal muscles tightened without holding a breath.
                                    - The back is straight.
                                    - Hands extended for the duration of the exercise.
                                    - Move the hands in a circular motion.
                                    - Breathe calmly and regularly, and do not hold your breath.
                                    """,
                          exeVideo:"QmWL0y92Wmc"),
                 Exercise(exeType: "Whole Body",
                          exeName: "Warm up ",
                          exeDesc: """
                                    1 round/3 minutes

                                    Important Notes:
                                    - Continue the exercise for the required number of minutes.
                                    - Breathe calmly and regularly, and do not hold your breath.
                                    """,
                          exeVideo:"Q7vOTzanI5Y")]

