//
//  SettingViewController.swift
//  HM15_HamburgerMenu
//
//  Created by Aliaksandr Hunko on 29/07/2022.
//

import UIKit

class SettingViewController: UIViewController {
    
    let settingLabel = UILabel()
    let backBtn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        Constraints()
    }
    
    //MARK: - Setup Layout
    
    func setupLayout() {
        view.backgroundColor = UIColor(named: "SlideMenuColor")
        
        settingLabel.text = "Setting"
        settingLabel.textAlignment = .center
        settingLabel.font = UIFont.boldSystemFont(ofSize: 26)
        settingLabel.textColor = .black
        view.addSubview(settingLabel)
        
        backBtn.backgroundColor = UIColor(named: "BtnColor")
        backBtn.clipsToBounds = true
        backBtn.layer.cornerRadius = 5
        backBtn.setTitle("Back", for: .normal)
        backBtn.setTitleColor(.black, for: .normal)
        backBtn.addTarget(self, action: #selector(showRootView), for: .touchUpInside)
        view.addSubview(backBtn)
        
    }
    
    //MARK: - Label Constraints
    
    func Constraints() {
        settingLabel.translatesAutoresizingMaskIntoConstraints = false
        
        settingLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1.5/2).isActive = true
        settingLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        settingLabel.topAnchor.constraint(equalTo: view.topAnchor,constant: 50).isActive = true
        settingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        // BackBtn constraints
        
        backBtn.translatesAutoresizingMaskIntoConstraints = false
        backBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 65).isActive = true
        backBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        backBtn.widthAnchor.constraint(equalToConstant: 60).isActive = true
        backBtn.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
    }
    
    //MARK: - Show Root View Controller
    
    @objc func showRootView() {
        let viewController = ViewController()
        viewController.modalPresentationStyle = .fullScreen
        viewController.modalTransitionStyle = .crossDissolve
        present(viewController, animated: true)
        
    }
}
