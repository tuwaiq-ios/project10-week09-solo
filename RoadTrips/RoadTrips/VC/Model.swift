//
//  Model.swift
//  RoadTrips
//
//  Created by Maram Al shahrani on 20/04/1443 AH.
//


import Foundation

struct Vaction {
    var image   : String
    var title   : String
    var comment: String?
    var desc    : String
    var isLiked: Bool
}

class Trip {
    static var trips = [
        
        Vaction(image: "1", title: "Bangkok،Thailand", desc: "Bangkok, the capital of Thailand and its main port, for those looking for a trip of recreation and relaxation that brings calm and psychological comfort, they have kayak trips or a river taxi across the fresh Bangkok rivers", isLiked: false),
        
        Vaction(image: "2", title: "London, England", desc: "London is the capital of Britain, and one of the most important tourist cities in England. The most famous landmarks of London: the historic Tower of London, which contains the famous Big Ben, Buckingham Palace and its gardens, the London Eye revolving wheel, Kensington Gardens, the London Market, Madame Tussauds “Wax Museum”", isLiked: false),
        
        Vaction(image: "3", title: "Paris,France", desc: "Paris, the French capital, the largest and most beautiful tourist city in France. the most important landmarks of Paris: the Eiffel Tower, Notre Dame Cathedral, Bastille Square, the Louvre Museum", isLiked: false),
        
        Vaction(image: "4", title: "Dubai United Arab Emirates", desc: "The largest city in the Emirati cities, Dubai, the largest city in the United Arab Emirates, a large and one area, BPI, what is unparalleled, B building what is strange and surprising striking, beginning with the Burj Khalifa, the tallest skyscraper in the world, and then the Burj Al Arab , then the largest recreational artificial palm island in the world.", isLiked: false),
        
        Vaction(image: "5", title: "Singapore in Singapore", desc: "Singapore is an island among 58 islands, and the capital of a country bearing the same name. Restaurants that offer a variety of culinary experiences from diverse cultures and civilizations that embody the demographics of their residents, dazzling bright shopping places, and finally festivals and annual holidays with a diversity of cultures.", isLiked: false),
        
        Vaction(image: "7", title: "New York, USA", desc: "New York is located in the United States of America, New York is famous for its world-renowned shopping and fine dining plazas around the most important tourist attractions such as the Statue of Liberty, Brooklyn Bridge, Empire State Building, Central Park, its neighborhoods and historical museums.", isLiked: false),
        
        Vaction(image: "8", title: "Tokyo, Japan", desc: "Tourism in Tokyo is one of the most beautiful cities in Japan, tourism in the whole world where tourism in Tokyo, and tourism projects from abroad, tourist buildings, commercial buildings and tourist buildings.", isLiked: false),
        
        Vaction(image: "10", title: "Venice", desc: "Venice, the capital of northern Italy’s Veneto region, is built on more than 100 small islands in a lagoon in the Adriatic Sea. It has no roads, just canals – including the Grand Canal thoroughfare – lined with Renaissance and Gothic palaces.", isLiked: false),
        
        Vaction(image: "11", title: "Barcelona, ​​Spain", desc: "Barcelona is one of the best tourist cities in the world. Barcelona, ​​Spain, includes an ancient and famous football club that attracts its fans from everywhere to follow its matches, in addition to a number of art galleries and museums with a rich cultural heritage that has distinguished the city for decades, being one of the most important tourism cities in Spain.", isLiked: false),
        
        Vaction(image: "12", title: "Bali, Indonesia", desc: "The island of Bali is one of the most beautiful tourist places in Indonesia. Bali has a group of the most beautiful and most charming beaches in the world, such as Seminyak, Nusa Dua, Kuta, and others.", isLiked: false) ,
        Vaction(image: "13", title: "Riyadh,Saudi Arabia", desc: "Tourism in Riyadh is one of the most important tourism cities in Saudi Arabia. Riyadh is the capital of the Kingdom of Saudi Arabia and is one of its largest cities in terms of area and also in terms of population. Riyadh is one of the largest Arab cities in the Arab world.", isLiked: false)
        
        
    ]
}
