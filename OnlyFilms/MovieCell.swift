import UIKit

class MovieCell: UITableViewCell {
    @IBOutlet weak var moviePosterIV: UIImageView!
    
    @IBOutlet weak var movieTitleLB: UILabel!
    
    @IBOutlet weak var movieRatingLB: UILabel!
    
    @IBOutlet weak var movieLanguageLB: UILabel!
    
    @IBOutlet weak var movieReleaseDateLB: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
