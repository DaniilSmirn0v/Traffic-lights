//
//  ViewController.swift
//  Traffic lights
//
//  Created by Даниил Смирнов on 14.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var yellowView: UIView!
    @IBOutlet weak var greenView: UIView!
    
    @IBOutlet weak var startButton: UIButton!
    
    private var currentLight = CurrentLights.red
    private let lightsIsOn: CGFloat = 1
    private let lightsIsOff: CGFloat = 0.3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUi()
        turnOffTheLight()
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        if startButton.currentTitle == "START" {
            startButton.setTitle("NEXT", for: .normal)
        }
        
        switch currentLight {
        case .red:
            greenView.alpha = lightsIsOff
            redView.alpha = lightsIsOn
            currentLight = .yellow
        case .yellow:
            redView.alpha = lightsIsOff
            yellowView.alpha = lightsIsOn
            currentLight = .green
        case .green:
            yellowView.alpha = lightsIsOff
            greenView.alpha = lightsIsOn
            currentLight = .red
        }
    }
}

extension ViewController {
    enum CurrentLights {
        case red
        case yellow
        case green
    }
    
    func setupUi() {
        view.backgroundColor = .black
        
        redView.layer.cornerRadius = redView.layer.frame.width / 2
        yellowView.layer.cornerRadius = yellowView.layer.frame.width / 2
        greenView.layer.cornerRadius = greenView.layer.frame.width / 2
        
        startButton.layer.cornerRadius = 14
        startButton.backgroundColor = .systemGray
        startButton.tintColor = .black
        startButton.setTitle("START", for: .normal)
    }
    
    func turnOffTheLight() {
        redView.alpha = lightsIsOff
        yellowView.alpha = lightsIsOff
        greenView.alpha = lightsIsOff
    }
}
