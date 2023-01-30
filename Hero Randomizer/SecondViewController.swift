//
//  SecondViewController.swift
//  Hero Randomizer
//
//  Created by Дархан Есенкул on 06.12.2022.
//

import UIKit

class SecondViewController: UIViewController {

    
    @IBOutlet private weak var heroName: UILabel!
    @IBOutlet private weak var fullName: UILabel!
    @IBOutlet private weak var aliases: UILabel!
    @IBOutlet private weak var placeOfBirth: UILabel!
    @IBOutlet private weak var publisher: UILabel!
    @IBOutlet private weak var gender: UILabel!
    @IBOutlet private weak var height: UILabel!
    @IBOutlet private weak var weight: UILabel!
    
    var myObj: HeroModelInfo?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        heroName.text = myObj?.name ?? ""
        fullName.text = myObj?.biography.fullName ?? ""
        aliases.text = myObj?.biography.aliases.first ?? ""
        placeOfBirth.text = myObj?.biography.placeOfBirth ?? ""
        publisher.text = myObj?.biography.publisher ?? ""
        gender.text = myObj?.appearance.gender ?? ""
        height.text = myObj?.appearance.height.last ?? ""
        weight.text = myObj?.appearance.weight.last ?? ""
        
    }
    

    
    @IBAction private func closeMoreInfoDidTap(_ sender: UIButton){
        dismiss(animated: true)
    }
}
