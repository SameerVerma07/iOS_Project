//
//  AthleteFormViewController.swift
//  FavoriteAthlete
//
//  Created by Sameer Verma - 21scse1011328
//

import UIKit

class AthleteFormViewController: UIViewController {
    
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var ageTextField: UITextField!
    @IBOutlet var leagueTextField: UITextField!
    @IBOutlet var teamTextField: UITextField!
    
    var athlete: Athlete?

    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        // Do any additional setup after loading the view.
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    init?(coder: NSCoder, athlete: Athlete?) {
        self.athlete = athlete
        super.init(coder: coder)
    }
    
    @IBAction func didPressedSaveButton(_ sender: UIButton) {
        guard let name = nameTextField.text,
            let ageString = ageTextField.text,
            let age = Int(ageString),
            let league = leagueTextField.text,
            let team = teamTextField.text else { return }
            athlete = Athlete(name: name, age: age, league: league,
            team: team)
        performSegue(withIdentifier: "unwindBack", sender: self)
    }
    
    func updateView() {
        guard let athlete = athlete else {
            return
        }
        nameTextField.text = athlete.name
        ageTextField.text = String(athlete.age)
        leagueTextField.text = athlete.league
        teamTextField.text = athlete.team
    }

}
