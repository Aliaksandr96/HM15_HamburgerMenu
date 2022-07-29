//
//  ViewController.swift
//  HM15_HamburgerMenu
//
//  Created by Aliaksandr Hunko on 26/07/2022.
//

import UIKit

class ViewController: UIViewController {
    
    let menuView = UIView()
    
    let menuViewBtn = UIButton()
    let closeBtn = UIButton()
    let settingViewBtn = UIButton()
    
    let imageButton = UIImageView()
    let imageClose = UIImageView()
    var backgroundImage = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        setupMenuBtn()
        setupMenuView()
        closeMenuViewBtn()
        openSettingView()
        
    }
    
    //MARK: - Setup Layout
    
    func setupLayout() {
        backgroundImage.image = UIImage(named: "Image2")
        backgroundImage.frame = view.frame
        backgroundImage.center = view.center
        backgroundImage.contentMode = .scaleAspectFill
        view.addSubview(backgroundImage)
        
        imageButton.image = UIImage(named: "HamburgerMenu")
        imageButton.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        menuViewBtn.center = imageButton.center
        
        view.addSubview(menuViewBtn)
        menuViewBtn.addSubview(imageButton)
        view.addSubview(menuView)
        
    }
    
    //MARK: - Setup Menu Btn
    
    func setupMenuBtn(){
        menuViewBtn.addTarget(self, action: #selector(showMenuView), for: .touchUpInside)
        menuViewBtn.translatesAutoresizingMaskIntoConstraints = false
        menuViewBtn.topAnchor.constraint(equalTo: view.topAnchor,constant: 50).isActive = true
        menuViewBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        
    }
    
    //MARK: - Setup MenuView
    
    func setupMenuView(){
        menuView.backgroundColor = UIColor(named: "SlideMenuColor")
        menuView.translatesAutoresizingMaskIntoConstraints = false
        menuView.clipsToBounds = true
        menuView.layer.cornerRadius = 25
        
        menuView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        menuView.trailingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        menuView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1.25/2).isActive = true
        menuView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
    
    //MARK: - Close MenuView
    
    func closeMenuViewBtn() {
        closeBtn.translatesAutoresizingMaskIntoConstraints = false
        imageClose.image = UIImage(named: "CloseMenu")
        imageClose.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        closeBtn.center = imageClose.center
        closeBtn.addTarget(self, action: #selector(closeMenuView), for: .touchUpInside)
        closeBtn.addSubview(imageClose)
        menuView.addSubview(closeBtn)
        
        closeBtn.trailingAnchor.constraint(equalTo: menuView.trailingAnchor, constant: -10).isActive = true
        closeBtn.topAnchor.constraint(equalTo: menuView.topAnchor, constant: 50).isActive = true
        
    }
    
    //MARK: - Show MenuView func
    
    @objc func showMenuView(){
        let xCoordinate = menuView.bounds.width
        let originalTransform = menuView.transform
        let scaledTransform = originalTransform.scaledBy(x: 1, y: 1)
        let scaledAndtranslatedTransform = scaledTransform.translatedBy(x: xCoordinate , y: 0)
        
        UIView.animate(withDuration: 0) {
            self.applyBlurEffect()
            
        }
        
        UIView.animate(withDuration: 0.5) {
            self.menuView.transform = scaledAndtranslatedTransform
            
        }
    }
    
    //MARK: - Close MenuView func
    
    @objc func closeMenuView() {
        self.removeBlurEffect()
        UIView.animate(withDuration: 0.3){
            self.menuView.transform = self.view.transform
            
        }
    }
    
    //MARK: - Setting View
    
    func openSettingView(){
        settingViewBtn.translatesAutoresizingMaskIntoConstraints = false
        settingViewBtn.backgroundColor = UIColor(named: "BtnColor")
        settingViewBtn.setTitle("Setting", for: .normal)
        settingViewBtn.setTitleColor(.black, for: .normal)
        settingViewBtn.clipsToBounds = true
        settingViewBtn.layer.cornerRadius = 10
        settingViewBtn.addTarget(self, action: #selector(showSettingView), for: .touchUpInside)
        menuView.addSubview(settingViewBtn)
        
        settingViewBtn.widthAnchor.constraint(equalTo: menuView.widthAnchor, multiplier: 1.5/2).isActive = true
        settingViewBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        settingViewBtn.centerXAnchor.constraint(equalTo: menuView.centerXAnchor).isActive = true
        settingViewBtn.topAnchor.constraint(equalTo: closeBtn.bottomAnchor, constant:  30).isActive = true
        
    }
    
    //MARK: - Show Setting View
    
    @objc func showSettingView(){
        let viewController = SettingViewController()
        viewController.modalPresentationStyle = .fullScreen
        viewController.modalTransitionStyle = .crossDissolve
        present(viewController, animated: true)
        
        
    }
    
    //MARK: - Blur Effect
    
    func applyBlurEffect(){
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        backgroundImage.addSubview(blurEffectView)
        
    }
    
    //MARK: - Remove Blur Effect
    
    func removeBlurEffect() {
        for backgroundImage in backgroundImage.subviews {
            if backgroundImage is UIVisualEffectView {
                backgroundImage.removeFromSuperview()
            }
        }
    }
}






