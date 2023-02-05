import UIKit

class MovieDetailsPopup: UIView {
    
    @IBOutlet weak var titleLB: UILabel!
    
    @IBOutlet weak var descLB: UILabel!
    @IBOutlet weak var posterIV: UIImageView!
    @IBOutlet weak var popupUV: UIView!
    @IBOutlet var parentUV: MovieDetailsPopup!
    
    let baseImageUrl = "https://image.tmdb.org/t/p/w500"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        Bundle.main.loadNibNamed("MovieDetailsPopup", owner: self, options: nil)
        setupDime()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupDime() {
        parentUV.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        parentUV.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    func showDetails(imagePath: String?, movieTitle: String?, movieDesc: String?) {
        parentUV.backgroundColor = UIColor(white: 1, alpha: 0)
        titleLB.text = movieTitle
        descLB.text = movieDesc
        posterIV.contentMode = .scaleAspectFit
        let url = URL(string: baseImageUrl + imagePath!)
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!)
            DispatchQueue.main.async {
                self.posterIV.image = UIImage(data: data!)
                let kw = UIApplication.shared.windows.first
                kw?.addSubview(self.parentUV)
            }
        }
    }
    
    @IBAction func hideAC(_ sender: Any) {
        parentUV.removeFromSuperview()
    }
}
