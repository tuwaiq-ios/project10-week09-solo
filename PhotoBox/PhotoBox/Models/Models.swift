//
//  Models.swift
//  PhotoBox
//
//  Created by Sana Alshahrani on 21/04/1443 AH.
//

import Foundation
import UIKit

struct Model {
    let image: String
    let height: CGFloat
    let name: String
    let descripe: String
    var comment: String?
    var isLiked : Bool
}
class pinterst {
 static var photos = [
    Model(image: "Khobar", height: CGFloat.random(in: 200...600), name: "Sana Alshahrani", descripe: "Al Khobar Tower, Al Khobar, Saudi Arabia. I like Khobar and it is my favorite place ❤️", isLiked: false),
    Model(image: "Pilot", height: CGFloat.random(in: 200...500), name: "George Gembala", descripe: "A Day in the Life of an Airline Pilot,Photo taken in Germany on April 30, 2012.", isLiked: false),
    Model(image: "Father", height: CGFloat.random(in: 200...500), name: "Amanda Heinz", descripe: "Las Vegas Photographer Mona Shield Payne specializes in corporate event photography", isLiked: false),
    Model(image: "Mirror", height: CGFloat.random(in: 200...600), name: "Briana Pelczer", descripe: "Full-time blogger and content creator Katerina Seigel created a laid-back", isLiked: false),
    Model(image: "You can", height: CGFloat.random(in: 200...500), name: "Lindsay Adkinson", descripe: "When you can tell your story and it doesn't make you cry, that's when you know you've healed.", isLiked: false),
    Model(image: "Positive", height: CGFloat.random(in: 300...500), name: "PEAU NEUVE", descripe: "A positive life requires a positive mentality. Inspirational And Motivational iPhone HD Wallpapers Quotes", isLiked: false),
    Model(image: "Caring", height: CGFloat.random(in: 200...500), name: "Hope", descripe: "supportive nurses are for their patients. We are often times their guidance and strength in very", isLiked: false),
    Model(image: "Hope", height: CGFloat.random(in: 200...500), name: "Cristina Chris", descripe: "Depression is an extremely trying and difficult experience in life. But you can get through it", isLiked: false),
    Model(image: "Time", height: CGFloat.random(in: 200...500), name: "Linda Pachy", descripe: "start improve your time management skills to live a better life", isLiked: false),
    Model(image: "Ice coffee", height: CGFloat.random(in: 200...500), name: "Devon Spungin", descripe: "This Iced Caramel Macchiato is the easiest thing you'll make all summer", isLiked: false),
    Model(image: "Beach", height: CGFloat.random(in: 200...500), name: "Ashlee Mandell", descripe: "The beach was deserted and it felt like we had our own private beach", isLiked: false),
    Model(image: "Laptop", height: CGFloat.random(in: 200...500), name: "JovanaCica", descripe: "Do not chase people. Work hard and be you. The right people who belong in your life Will come and find you and stay", isLiked: false),
    Model(image: "Coffee", height: CGFloat.random(in: 200...500), name: "JovanaCica", descripe: "Coffee is one of favorite drinks for many people. Drinking coffee helps to wake you up or make you relax", isLiked: false),
    Model(image: "Mir", height: CGFloat.random(in: 200...500), name: "Kim Dark", descripe: "Frame your builder grade Mirror to look like a West Elm Mirror. DIY tutorial", isLiked: false),
    Model(image: "Life", height: CGFloat.random(in: 200...500), name: "Shannon Schroeder", descripe: "Challenge yourself to shift the perspective of your view of the world and the things that happen", isLiked: false),
    Model(image: "Doctor", height: CGFloat.random(in: 200...500), name: "Jeanetth Ramos", descripe: "You’ll know you are safe. You’ll know that my hand held yours last. This is why I stay.", isLiked: false),
    Model(image: "Work", height: CGFloat.random(in: 200...500), name: "Leesa | Daham ", descripe: "Do not chase people. Work hard and be you. The right people who belong in your life Will come and find you and stay", isLiked: false),
    Model(image: "Smile", height: CGFloat.random(in: 200...500), name: "Mirabilia M", descripe: "You can attract happy and positive feelings, That's how the Law of Attraction works", isLiked: false),
]

}
