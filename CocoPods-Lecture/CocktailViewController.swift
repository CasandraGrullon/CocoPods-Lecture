//
//  ViewController.swift
//  CocoPods-Lecture
//
//  Created by casandra grullon on 2/27/20.
//  Copyright © 2020 casandra grullon. All rights reserved.
//

import UIKit
import Kingfisher

class CocktailViewController: UIViewController {

    private let cocktailView = CocktailView()
    
    private lazy var swipeGesture: UISwipeGestureRecognizer = {
       let gesture = UISwipeGestureRecognizer()
        gesture.addTarget(self, action: #selector(fetchCocktail))
        gesture.direction = .left
        return gesture
    }()
    
    override func loadView() {
        view = cocktailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        fetchCocktail()
        //set up swipe gesture on image
        cocktailView.cocktailImage.isUserInteractionEnabled = true
        cocktailView.cocktailImage.addGestureRecognizer(swipeGesture)
    }
    
    //shake device to change the cocktail
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            fetchCocktail()
        }
    }
    
    @objc private func fetchCocktail() {
        APIClient.fetchCocktail { (result) in
            switch result {
            case .failure(let error):
                print("couldnt get data \(error)")
            case .success(let cocktail):
                DispatchQueue.main.async {
                    self.updateUI(cocktail)
                }
            }
        }
    }
    
    private func updateUI(_ cocktail: Cocktail) {
        cocktailView.cocktailNameLabel.text = cocktail.strDrink
        cocktailView.ingredients.text = cocktail.ingredients
        
        guard let imageURL = URL(string: cocktail.strDrinkThumb) else {
            return
        }
        
        cocktailView.cocktailImage.kf.setImage(with: imageURL)
        
        UIView.transition(with: cocktailView, duration: 1.0, options: [.transitionCrossDissolve, .curveEaseInOut], animations: { self.cocktailView.cocktailImage.kf.setImage(with: imageURL) }, completion: nil)
    }


}

