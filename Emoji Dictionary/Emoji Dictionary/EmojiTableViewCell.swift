//  Created by Sameer Verma on 23/04/24.
//  Created by Sameer Verma on 23/04/24.

import UIKit
class EmojiTableViewCell: UITableViewCell {
    
    @IBOutlet var symbolLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //  Created by Sameer Verma on 23/04/24.
    //  Created by Sameer Verma on 23/04/24.
    
    func update(emoji: Emoji) {
        symbolLabel.text = emoji.symbol
        nameLabel.text = emoji.name
        descriptionLabel.text = emoji.description
    }

}
