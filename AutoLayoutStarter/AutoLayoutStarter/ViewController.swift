//
//  ViewController.swift
//  AutoLayoutStarter
//
//  Created by Derrick Park on 2019-04-17.
//  Copyright © 2019 Derrick Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  let mainView: UIView = {
    let main = UIView()
    // important when setting contraints programmatically
    main.translatesAutoresizingMaskIntoConstraints = false
    main.backgroundColor = .green
    return main
  }()
  
  let squareButton: UIButton = {
    let butt = UIButton(type: .system)
    butt.setTitle("Square", for: .normal)
    butt.translatesAutoresizingMaskIntoConstraints = false
    butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    butt.addTarget(self, action: #selector(squareTapped), for: .touchUpInside)
    return butt
  }()
  
  let portraitButton: UIButton = {
    let butt = UIButton(type: .system)
    butt.setTitle("Portrait", for: .normal)
    butt.translatesAutoresizingMaskIntoConstraints = false
    butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    butt.addTarget(self, action: #selector(portraitTapped), for: .touchUpInside)
    return butt
  }()
  
  let landScapeButton: UIButton = {
    let butt = UIButton(type: .system)
    butt.setTitle("Landscape", for: .normal)
    butt.translatesAutoresizingMaskIntoConstraints = false
    butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    butt.addTarget(self, action: #selector(landscapeTapped), for: .touchUpInside)
    return butt
  }()
    
  let purpleBox: UIView = {
    let box = UIView()
    box.frame = CGRect.zero
    box.translatesAutoresizingMaskIntoConstraints = false
    box.backgroundColor = .purple
    return box
  }()
    
  let blueBox1: UIView = {
    let box = UIView()
    box.frame = CGRect.zero
    box.translatesAutoresizingMaskIntoConstraints = false
    box.backgroundColor = .blue
    return box
  }()
  
  let blueBox2: UIView = {
    let box = UIView()
    box.frame = CGRect.zero
    box.translatesAutoresizingMaskIntoConstraints = false
    box.backgroundColor = .blue
    return box
  }()

  let blueBox3: UIView = {
    let box = UIView()
    box.frame = CGRect.zero
    box.translatesAutoresizingMaskIntoConstraints = false
    box.backgroundColor = .blue
    return box
  }()
    
  let orangeBox1: UIView = {
    let box = UIView()
    box.frame = CGRect.zero
    box.translatesAutoresizingMaskIntoConstraints = false
    box.backgroundColor = .orange
    return box
  }()
    
  let orangeBox2: UIView = {
    let box = UIView()
    box.frame = CGRect.zero
    box.translatesAutoresizingMaskIntoConstraints = false
    box.backgroundColor = .orange
    return box
  }()
  
  var widthAnchor: NSLayoutConstraint?
  var heightAnchor: NSLayoutConstraint?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    view.addSubview(mainView)
    setupLayout()
  }

  fileprivate func setupLayout() {
    mainView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    mainView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    widthAnchor = mainView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7, constant: 0)
    widthAnchor?.isActive = true
    
    heightAnchor = mainView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7, constant: 0)
    heightAnchor?.isActive = true
    
    let buttStackView = UIStackView(arrangedSubviews: [
      squareButton, portraitButton, landScapeButton])
    buttStackView.translatesAutoresizingMaskIntoConstraints = false
    buttStackView.axis = .horizontal
    buttStackView.alignment = .center
    buttStackView.distribution = .fillEqually
    
    view.addSubview(buttStackView)
    NSLayoutConstraint.activate([
      buttStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
      buttStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      buttStackView.heightAnchor.constraint(equalToConstant: 50),
      buttStackView.widthAnchor.constraint(equalTo: view.widthAnchor)
      ])
      
    // add purple box
    mainView.addSubview(purpleBox)
    // set constraint
    NSLayoutConstraint.activate([
      purpleBox.bottomAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.bottomAnchor, constant: -50),
      purpleBox.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20),
      purpleBox.heightAnchor.constraint(equalToConstant: 50),
      purpleBox.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 0.6)
    ])
      
    // not working properly
    //    let blueBox2 = blueBox1
    //    let blueBox3 = blueBox2
      
    let blueBoxStackView = UIStackView(arrangedSubviews: [
        blueBox1, blueBox2, blueBox3
    ])
      
    for box in blueBoxStackView.arrangedSubviews {
        NSLayoutConstraint.activate([
            box.heightAnchor.constraint(equalToConstant: 50),
            box.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
      
    blueBoxStackView.translatesAutoresizingMaskIntoConstraints = false
    blueBoxStackView.axis = .vertical
    blueBoxStackView.alignment = .center
    blueBoxStackView.distribution = .equalSpacing
    blueBoxStackView.spacing = 20
    
    mainView.addSubview(blueBoxStackView)
      
    NSLayoutConstraint.activate([
      blueBoxStackView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
      blueBoxStackView.centerYAnchor.constraint(equalTo: mainView.centerYAnchor),
      blueBoxStackView.heightAnchor.constraint(equalTo: mainView.heightAnchor,multiplier:0.5),
    ])
      
    let redBoxStackView = UIStackView(arrangedSubviews: [
        orangeBox1, orangeBox2
    ])
      
    for (idx, box) in redBoxStackView.arrangedSubviews.enumerated() {
      let height:CGFloat = 30
      let width:CGFloat = idx != redBoxStackView.arrangedSubviews.count - 1 ? 40 : 50
      NSLayoutConstraint.activate([
        box.heightAnchor.constraint(equalToConstant: height),
        box.widthAnchor.constraint(equalToConstant: width)
    ])
    }
      
    redBoxStackView.translatesAutoresizingMaskIntoConstraints = false
    redBoxStackView.axis = .horizontal
    redBoxStackView.alignment = .center
    redBoxStackView.distribution = .equalSpacing
    redBoxStackView.spacing = UIStackView.spacingUseSystem
    redBoxStackView.isLayoutMarginsRelativeArrangement = true
    redBoxStackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
    redBoxStackView.backgroundColor = .red
    
    mainView.addSubview(redBoxStackView)
      
    NSLayoutConstraint.activate([
      redBoxStackView.topAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.topAnchor, constant: 50),
      redBoxStackView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20),
      redBoxStackView.heightAnchor.constraint(equalToConstant: 50),
    ])
      
  }

  @objc private func squareTapped() {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 2.0) {
      self.widthAnchor?.isActive = false
      self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
      self.widthAnchor?.isActive = true
      
      self.heightAnchor?.isActive = false
      self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
      self.heightAnchor?.isActive = true
      self.view.layoutIfNeeded()
    }
  }
  
  @objc private func portraitTapped() {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 2.0) {
      self.widthAnchor?.isActive = false
      self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.7)
      self.widthAnchor?.isActive = true
      
      self.heightAnchor?.isActive = false
      self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.7)
      self.heightAnchor?.isActive = true
      self.view.layoutIfNeeded()
    }
    
  }
  
  @objc private func landscapeTapped() {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 2.0) {
      self.widthAnchor?.isActive = false
      self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.95)
      self.widthAnchor?.isActive = true
      
      self.heightAnchor?.isActive = false
      self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.4)
      self.heightAnchor?.isActive = true
      self.view.layoutIfNeeded()
    }
  }
}

