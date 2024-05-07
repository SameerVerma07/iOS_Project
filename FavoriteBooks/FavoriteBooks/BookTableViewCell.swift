//
//  BookTableViewCell.swift
//  FavoriteBooks
//
//  Created by Volodymyr Ostapyshyn on 01.01.2021.
//

import UIKit

class BookTableViewCell: UITableViewCell {
    
    @IBOutlet var title: UILabel!
    @IBOutlet var author: UILabel!
    @IBOutlet var genre: UILabel!
    @IBOutlet var length: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func update(with book: Book) {
        title.text = book.title
        author.text = book.author
        genre.text = book.genre
        length.text = book.length
    }

}
