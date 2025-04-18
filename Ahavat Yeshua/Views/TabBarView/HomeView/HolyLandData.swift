//
//  HolyLandData.swift
//  Ahavat Yeshua
//
//  Created by Ilia Pavlov on 4/18/25.
//

import MapKit

struct HolyPlace: Identifiable {
    var id = UUID()
    var name: String
    var coordinate: CLLocationCoordinate2D
    var description: String
    var bibleReference: String // Added bibleReference property
}

struct HolyLandData {
    let holyPlaces = [
           HolyPlace(name: "Jerusalem", coordinate: CLLocationCoordinate2D(latitude: 31.7683, longitude: 35.2137), description: "Holy city in Israel, home of the Western Wall. Jesus taught here and was crucified in the nearby Golgotha.", bibleReference: "Matthew 27:33-35"),
           HolyPlace(name: "Bethlehem", coordinate: CLLocationCoordinate2D(latitude: 31.7054, longitude: 35.2075), description: "Birthplace of Jesus Christ. Jesus was born in a stable here, as recounted in the Gospel of Luke.", bibleReference: "Luke 2:4-7"),
           HolyPlace(name: "Nazareth", coordinate: CLLocationCoordinate2D(latitude: 32.6996, longitude: 35.3034), description: "The hometown of Jesus. He grew up here and started his ministry, as noted in the Gospels.", bibleReference: "Matthew 2:23"),
           HolyPlace(name: "Capernaum", coordinate: CLLocationCoordinate2D(latitude: 32.8803, longitude: 35.5650), description: "A town where Jesus performed many miracles, including healing a paralytic and teaching in the synagogue.", bibleReference: "Mark 2:1-12"),
           HolyPlace(name: "Sea of Galilee", coordinate: CLLocationCoordinate2D(latitude: 32.8801, longitude: 35.5174), description: "Jesus walked on water and performed the miracle of feeding the 5,000 here.", bibleReference: "John 6:16-21"),
           HolyPlace(name: "Mount of Olives", coordinate: CLLocationCoordinate2D(latitude: 31.7780, longitude: 35.2560), description: "Jesus prayed here before his arrest and crucifixion. It's also the site of his ascension to heaven.", bibleReference: "Luke 22:39-46"),
           HolyPlace(name: "Golgotha", coordinate: CLLocationCoordinate2D(latitude: 31.7767, longitude: 35.2332), description: "The hill where Jesus was crucified. Known as Calvary.", bibleReference: "John 19:17-18"),
           HolyPlace(name: "Jordan River", coordinate: CLLocationCoordinate2D(latitude: 31.7712, longitude: 35.2045), description: "Jesus was baptized here by John the Baptist, marking the beginning of his ministry.", bibleReference: "Matthew 3:13-17"),
           HolyPlace(name: "Mount Hermon", coordinate: CLLocationCoordinate2D(latitude: 33.4167, longitude: 35.8333), description: "The site of the Transfiguration of Jesus, where his divine nature was revealed to Peter, James, and John.", bibleReference: "Matthew 17:1-9"),
           HolyPlace(name: "Bethany", coordinate: CLLocationCoordinate2D(latitude: 31.7713, longitude: 35.2371), description: "The town where Jesus raised Lazarus from the dead. It’s also the location where Jesus ascended into heaven.", bibleReference: "John 11:1-44"),
           HolyPlace(name: "Ephesus", coordinate: CLLocationCoordinate2D(latitude: 37.9515, longitude: 27.3733), description: "The site where the Apostle Paul, who was closely associated with Jesus' ministry, preached.", bibleReference: "Acts 19:1-10")
       ]
}
