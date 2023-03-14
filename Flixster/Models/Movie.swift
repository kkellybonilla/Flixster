//
//  Movie.swift
//  project2-FlixsterPt1
//
//  Created by Kelly Bonilla Guzmán on 3/6/23.
//

import Foundation

struct MoviesResponse: Decodable {
    let results: [Movie]
}

struct Movie: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case title
        case overview
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case popularity
    }
    
    let title: String
    let overview: String
    let posterPath: String
    let backdropPath: String
    let voteAverage: Float
    let voteCount: Int
    let popularity: Float
}

//extension Movie {
//    static var mockMovies: [Movie] = [
//        Movie(title: "Knock at the Cabin",
//              overview: "While vacationing at a remote cabin, a young girl and her two fathers are taken hostage by four armed strangers who demand that the family make an unthinkable choice to avert the apocalypse. With limited access to the outside world, the family must decide what they believe before all is lost.",
//              posterImage: URL(string: "https://www.themoviedb.org/t/p/w1280/dm06L9pxDOL9jNSK4Cb6y139rrG.jpg")!,
//              backdropImage: URL(string: "https://www.themoviedb.org/t/p/w1066_and_h600_bestv2/22z44LPkMyf5nyyXvv8qQLsbom.jpg")!,
//              voteAverage: 6.6,
//              voteCount: 751,
//              popularity: 4286.16),
//        Movie(title: "Black Panther: Wakanda Forever",
//              overview: "Queen Ramonda, Shuri, M’Baku, Okoye and the Dora Milaje fight to protect their nation from intervening world powers in the wake of King T’Challa’s death. As the Wakandans strive to embrace their next chapter, the heroes must band together with the help of War Dog Nakia and Everett Ross and forge a new path for the kingdom of Wakanda.",
//              posterImage: URL(string: "https://www.themoviedb.org/t/p/w1280/sv1xJUazXeYqALzczSZ3O6nkH75.jpg")!,
//              backdropImage: URL(string: "https://www.themoviedb.org/t/p/w1066_and_h600_bestv2/xDMIl84Qo5Tsu62c9DGWhmPI67A.jpg")!,
//              voteAverage: 7.4,
//              voteCount: 3783,
//              popularity: 2949.117),
//        Movie(title: "Puss in Boots: The Last Wish",
//              overview: "Puss in Boots discovers that his passion for adventure has taken its toll: He has burned through eight of his nine lives, leaving him with only one life left. Puss sets out on an epic journey to find the mythical Last Wish and restore his nine lives.",
//              posterImage: URL(string: "https://www.themoviedb.org/t/p/w1280/kuf6dutpsT0vSVehic3EZIqkOBt.jpg")!,
//              backdropImage: URL(string: "https://www.themoviedb.org/t/p/w1066_and_h600_bestv2/b1Y8SUb12gPHCSSSNlbX4nB3IKy.jpg")!,
//              voteAverage: 8.4,
//              voteCount: 4235,
//              popularity: 2820.651),
//        Movie(title: "Plane",
//              overview: "After a heroic job of successfully landing his storm-damaged aircraft in a war zone, a fearless pilot finds himself between the agendas of multiple militias planning to take the plane and its passengers hostage.",
//              posterImage: URL(string: "https://www.themoviedb.org/t/p/w1280/qi9r5xBgcc9KTxlOLjssEbDgO0J.jpg")!,
//              backdropImage: URL(string: "https://www.themoviedb.org/t/p/w1066_and_h600_bestv2/9Rq14Eyrf7Tu1xk0Pl7VcNbNh1n.jpg")!,
//              voteAverage: 6.9,
//              voteCount: 754,
//              popularity: 2200.205),
//        Movie(title: "Little Dixie",
//              overview: "Erstwhile Special Forces operative Doc Alexander is asked to broker a truce with the Mexican drug cartel in secrecy. When Oklahoma Governor Richard Jeffs celebrates the execution of a high-ranking cartel member on TV, his Chief of Staff and Doc inform him about the peace he just ended. But it’s too late, as Cuco, the cartel’s hatchet man, has set his vengeful sights on Doc’s daughter Dixie.",
//              posterImage: URL(string: "https://www.themoviedb.org/t/p/w1280/cmWTZj9zzT9KFt3XyL0gssL7Ig8.jpg")!,
//              backdropImage: URL(string: "https://www.themoviedb.org/t/p/w1066_and_h600_bestv2/k4V6EvpcOsu8CX10JD0H53lFXLq.jpg")!,
//              voteAverage: 6.3,
//              voteCount: 44,
//              popularity: 1698.096),
//        Movie(title: "Huesera: The Bone Woman",
//              overview: "Valeria's joy at becoming a first-time mother is quickly taken away when she's cursed by a sinister entity. As danger closes in, she's forced deeper into a chilling world of dark magic that threatens to consume her.",
//              posterImage: URL(string: "https://www.themoviedb.org/t/p/w1280/7NhG3NClQ1xrc3kEwTiwFht5Y3L.jpg")!,
//              backdropImage: URL(string: "https://www.themoviedb.org/t/p/w1066_and_h600_bestv2/A2avUoNFstnBhAnHiogXQs4c9Bt.jpg")!,
//              voteAverage: 6.8,
//              voteCount: 57,
//              popularity: 1511.332),
//        Movie(title: "M3GAN",
//              overview: "A brilliant toy company roboticist uses artificial intelligence to develop M3GAN, a life-like doll programmed to emotionally bond with her newly orphaned niece. But when the doll's programming works too well, she becomes overprotective of her new friend with terrifying results.",
//              posterImage: URL(string: "https://www.themoviedb.org/t/p/w1280/d9nBoowhjiiYc4FBNtQkPY7c11H.jpg")!,
//              backdropImage: URL(string: "https://www.themoviedb.org/t/p/w1066_and_h600_bestv2/dlrWhn0G3AtxYUx2D9P2bmzcsvF.jpg")!,
//              voteAverage: 7.5,
//              voteCount: 1864,
//              popularity: 1420.255),
//        Movie(title: "Shotgun Wedding",
//              overview: "Darcy and Tom gather their families for the ultimate destination wedding but when the entire party is taken hostage, “’Til Death Do Us Part” takes on a whole new meaning in this hilarious, adrenaline-fueled adventure as Darcy and Tom must save their loved ones—if they don’t kill each other first.",
//              posterImage: URL(string: "https://www.themoviedb.org/t/p/w1280/t79ozwWnwekO0ADIzsFP1E5SkvR.jpg")!,
//              backdropImage: URL(string: "https://www.themoviedb.org/t/p/w1066_and_h600_bestv2/zGoZB4CboMzY1z4G3nU6BWnMDB2.jpg")!,
//              voteAverage: 6.4,
//              voteCount: 578,
//              popularity: 1202.528),
//        Movie(title: "Creed III",
//              overview: "After dominating the boxing world, Adonis Creed has been thriving in both his career and family life. When a childhood friend and former boxing prodigy, Damien Anderson, resurfaces after serving a long sentence in prison, he is eager to prove that he deserves his shot in the ring. The face-off between former friends is more than just a fight. To settle the score, Adonis must put his future on the line to battle Damien - a fighter who has nothing to lose.",
//              posterImage: URL(string: "https://www.themoviedb.org/t/p/w1280/cvsXj3I9Q2iyyIo95AecSd1tad7.jpg")!,
//              backdropImage: URL(string: "https://www.themoviedb.org/t/p/w1066_and_h600_bestv2/26YLjaC1udGEmSvlM1P5eBGWO5h.jpg")!,
//              voteAverage: 7.2,
//              voteCount: 104,
//              popularity: 1194.546)
//    ]
//}
