import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func showUpcomingMovies(_ sender: Any) {
        loadApi(category: .upcoming)
    }
    
    @IBAction func showTopRatedMovies(_ sender: Any) {
        loadApi(category: .topRated)
    }
    @IBAction func showPopularMovies(_ sender: Any) {
        loadApi(category: .popular)
    }
    
    func loadApi(category: MovieCategories) {
        NetworkManager.shared.requestForApi(category: category) { data in
            guard let data = data as? [String: Any] else {return}
            guard let results = data["results"] as? [[String: Any]] else {return}
            let showMoviesVC = self.storyboard?.instantiateViewController(withIdentifier: "ShowMoviesVCViewController") as? ShowMoviesVCViewController
            showMoviesVC?.movies = results.map {MovieModel(data: $0)}
            DispatchQueue.main.async { [weak self] in
                self?.navigationController?.pushViewController(showMoviesVC!, animated: true)
            }
        }
    }
}

