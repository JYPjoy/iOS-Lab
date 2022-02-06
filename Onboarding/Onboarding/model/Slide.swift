//
//  Slide.swift
//  Onboarding
//
//  Created by Jiyoung Park on 2021/08/05.
//

import Foundation

struct Slide {
    let imageName: String
    let title: String
    let description: String
    
    static let collection: [Slide] = [
        Slide(
            imageName: "imSlide1",
            //imageName: "img1",
            title: "Welcome to Trafel",
            description: "Trafel allows you to travel around the world, make new friends and create memorable experiences"),
        Slide(
            imageName: "imSlide2",
            title: "Connect Socially",
            description: "Connect across continents to strangers via the app"),
        Slide(
            imageName: "imSlide3",
            title: "Safe And Secure",
            description: "Eacj trip is planned according to the strictest safety standards to ensure passenger safety"),
        Slide(
            imageName: "imSlide4",
            title: "Safe And Secure",
            description: "Eacj trip is planned according to the strictest safety standards to ensure passenger safety")
    ]
}
