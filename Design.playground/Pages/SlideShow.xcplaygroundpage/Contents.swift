class Photo {
    let name: String
    init(name: String) {
        self.name = name
    }
}

class SlideShow {
    let favourites: [Photo]
    let photos: [Photo]
    
    var favIdx = 0
    var photoIdx = 0
    var showingFavourites = false
    
    init(favourites: [Photo], photos: [Photo]) {
        self.favourites = favourites
        self.photos = photos
    }
    
    func getNextPhoto() -> Photo? {
        if !showingFavourites {
            let photo = favourites[favIdx]
            favIdx += 1
            if favIdx == favourites.count {
                favIdx = 0
                showingFavourites = true
            }
            return photo
        } else {
            while photoIdx < photos.count {
                if favIdx < favourites.count, favourites[favIdx] === photos[photoIdx] {
                    favIdx += 1
                    photoIdx += 1
                } else {
                    let photo = photos[photoIdx]
                    photoIdx += 1
                    return photo
                }
            }
        }
        return nil
    }
}

let photos = [
    Photo(name: "Cape cod"),
    Photo(name: "Raithorpe"),
    Photo(name: "Miami"),
    Photo(name: "London"),
    Photo(name: "Las Palmas"),
]

let favourites = [
    photos[0],
    photos[2]
]

let slideShow = SlideShow(favourites: favourites, photos: photos)
for _ in 0..<photos.count + 2 {
    print(slideShow.getNextPhoto()?.name ?? "Empty")
}
