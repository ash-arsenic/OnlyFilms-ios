import Foundation

class MovieModel {
    var adult: Int?
    var backdropPath: String?
    var genreIds: [Int]?
    var id: Int?
    var originalLanguage: String?
    var orginalTitle: String?
    var overview: String?
    var popularity: String?
    var posterPath: String?
    var releaseDate: String?
    var title: String?
    var video: Int?
    var voteAverage: Double?
    var voteCount: Int?
    
    init(data: [String: Any]) {
        if let adult = data["adult"] as? Int {
            self.adult = Int(adult)
        }
        if let backdropPath = data["backdrop_path"] as? String{
            self.backdropPath = String(backdropPath)
        }
        if let genreIds = data["genre_ids"] as? [Int]{
            self.genreIds = genreIds
        }
        if let id = data["id"] as? Int {
            self.id = Int(id)
        }
        if let originalLanguage = data["original_language"] as? String{
            self.originalLanguage = String(originalLanguage)
        }
        if let orginalTitle = data["orginal_title"] as? String{
            self.orginalTitle = String(orginalTitle)
        }
        if let overview = data["overview"] as? String{
            self.overview = String(overview)
        }
        if let popularity = data["popularity"] as? String{
            self.popularity = String(popularity)
        }
        if let posterPath = data["poster_path"] as? String{
            self.posterPath = String(posterPath)
        }
        if let releaseDate = data["release_date"] as? String{
            self.releaseDate = String(releaseDate)
        }
        if let title = data["title"] as? String{
            self.title = String(title)
        }
        if let video = data["video"] as? Int{
            self.video = Int(video)
        }
        if let voteAverage = data["vote_average"] as? Double{
            self.voteAverage = Double(voteAverage)
        }
        if let voteCount = data["vote_count"] as? Int{
            self.voteCount = Int(voteCount)
        }
        
    }
}
