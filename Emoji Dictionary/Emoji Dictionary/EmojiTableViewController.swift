//  Created by Sameer Verma on 23/04/24.
//  Created by Sameer Verma on 23/04/24.

import UIKit

class EmojiTableViewController: UITableViewController {
    
    
    
    var emojis: [Emoji] = []{
        willSet {
            Emoji.saveToFile(emojis: newValue)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let emojis = Emoji.loadFromFile()
        if !emojis.isEmpty {
            self.emojis = emojis
        } else {
            self.emojis = Emoji.sampleEmojis
        }
        
        tableView.cellLayoutMarginsFollowReadableWidth  = true

       self.navigationItem.leftBarButtonItem = self.editButtonItem
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
     return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return emojis.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmojiCell", for: indexPath) as! EmojiTableViewCell

        // Configure the cell...
        let emoji = emojis[indexPath.row]

        cell.update(emoji: emoji)
        cell.showsReorderControl = true

        return cell
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
       let emojiToBeMoved = emojis.remove(at: sourceIndexPath.row)
        emojis.insert(emojiToBeMoved,at: destinationIndexPath.row)
        
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            emojis.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)

        }
    }
   
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        
        return.delete
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    @IBSegueAction func addEditEmoji(_ coder: NSCoder, sender: Any?) -> AddEditEmojiTableViewController? {
        // edit existing emoji
        if let cell = sender as? UITableViewCell, let indexpath = tableView.indexPath(for: cell) {
            let emojiToEdit = emojis[indexpath.row]
            return AddEditEmojiTableViewController(coder: coder, emoji: emojiToEdit)
        } else {
            // add emoji
            return AddEditEmojiTableViewController(coder: coder, emoji: nil)
        }
    }
    
    @IBAction func unwindToEmojiTableViewController(segue: UIStoryboardSegue){
        
        guard segue.identifier == "saveUnwind", let sourceViewController = segue.source as? AddEditEmojiTableViewController, let emoji = sourceViewController.emoji else {return}
        
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            emojis[selectedIndexPath.row] = emoji
            tableView.reloadRows(at: [selectedIndexPath], with: .none)
        } else {
            let newIndexPath = IndexPath(row: emojis.count, section: 0)
            emojis.append(emoji)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
        //  Created by Sameer Verma on 23/04/24.
        //  Created by Sameer Verma on 23/04/24.
    }
    
}
