import UIKit

class ShowMoviesVCViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
//    Vars
    @IBOutlet weak var moviesTV: UITableView!
    var movie: MovieDetailsPopup?
    var movies: [MovieModel]?
    let baseImageUrl = "https://image.tmdb.org/t/p/w500"
//    Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        moviesTV.delegate = self
        moviesTV.dataSource = self
        movie = MovieDetailsPopup()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MovieCell
        
        cell?.movieTitleLB.text = movies?[indexPath.row].title
        cell?.movieRatingLB.text = String(movies?[indexPath.row].voteAverage ?? 9.6)
        cell?.movieLanguageLB.text = movies?[indexPath.row].originalLanguage
        cell?.movieReleaseDateLB.text = movies?[indexPath.row].releaseDate
        cell?.moviePosterIV.contentMode = .scaleAspectFit
        let url = URL(string: baseImageUrl + (movies?[indexPath.row].posterPath ?? "/3bhkrj58Vtu7enYsRolD1fZdja1.jpg"))
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!)
            DispatchQueue.main.async {
                cell?.moviePosterIV.image = UIImage(data: data!)
            }
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        movie?.showDetails(imagePath: movies?[indexPath.row].backdropPath, movieTitle: movies?[indexPath.row].title, movieDesc: movies?[indexPath.row].overview)
//        let popup = PopUpView()
//        popup.showAlert(title: "hellloo", description: "day 2", type: .singleButton, caller: .second)
    }
}
