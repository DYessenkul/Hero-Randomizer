//
//  ViewController.swift
//  Hero Randomizer
//
//  Created by Дархан Есенкул on 04.12.2022.
//

import UIKit
import Kingfisher

class ViewController: UIViewController, NetworkManagerDelegate {
   
    @IBOutlet private weak var heroName: UILabel!
    @IBOutlet private weak var heroImage: UIImageView!
    @IBOutlet private weak var intelligenceProgressView: UIProgressView!
    @IBOutlet private weak var powerProgressView: UIProgressView!
    @IBOutlet private weak var speedProgressView: UIProgressView!
    @IBOutlet private weak var intelligenceItem: UILabel!
    @IBOutlet private weak var powerItem: UILabel!
    @IBOutlet private weak var speedItem: UILabel!
    

     var heroNameInMoreInfo: String = ""
     var fullName: String = ""
     var aliases: [String] = []
     var placeOfBirth: String = ""
     var publisher: String = ""
     var gender: String = ""
     var height: [String] = []
     var weight: [String] = []
    
    
    var networkManager = NetworkManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        networkManager.delegate = self
        intelligenceProgressView.transform = intelligenceProgressView.transform.scaledBy(x: 1, y: 2)
        powerProgressView.transform = powerProgressView.transform.scaledBy(x: 1, y: 2)
        speedProgressView.transform = speedProgressView.transform.scaledBy(x: 1, y: 2)
        heroImage.layer.cornerRadius = 200
        heroImage.clipsToBounds = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMoreInfo"{
            if let secVC = segue.destination as? SecondViewController{
                let heroName = heroNameInMoreInfo
                let fullName = fullName
                let aliases = aliases
                let placeOfBirth = placeOfBirth
                let publisher = publisher
                let gender = gender
                let height = height
                let weight = weight
                let appearance = Appearance(gender: gender, height: height, weight: weight)
                let biography = Biography(fullName: fullName, aliases: aliases, placeOfBirth: placeOfBirth, publisher: publisher)
         let myObj = HeroModelInfo(name: heroName, appearance: appearance, biography: biography)
                secVC.myObj = myObj
            }
        }
    }

    
    @IBAction private func moreHeroInfoDidTap(_ sender: UIButton){
        performSegue(withIdentifier: "showMoreInfo", sender: self)
    }
    
    @IBAction private func getHeroButtonDidTap(_ sender: UIButton){
        let randomId = Int.random(in: 1...731)
        networkManager.getHero(by: randomId)
    }

    func onUpdateHero(with model: HeroModelResponse) {
        heroName.text = model.name
        intelligenceProgressView.progress = Float((round(Float(model.powerstats.intelligence))/10)/10)
        intelligenceItem.text = String(model.powerstats.intelligence)
        powerProgressView.progress = Float((round(Float(model.powerstats.power))/10)/10)
        powerItem.text = String(model.powerstats.power)
        speedProgressView.progress = Float((round(Float(model.powerstats.speed))/10)/10)
        speedItem.text = String(model.powerstats.speed)
        let imageUrl = URL(string: model.images.sm)
        heroImage.kf.setImage(with: imageUrl)
        
        heroNameInMoreInfo = model.name
        fullName = model.biography.fullName
        aliases = model.biography.aliases
        placeOfBirth = model.biography.placeOfBirth
        publisher = model.biography.publisher
        gender = model.appearance.gender
        height = model.appearance.height
        weight = model.appearance.weight
        
    }

}

