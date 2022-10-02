//
//  ViewController.swift
//  Hamburger_Menu
//
//  Created by Aliaksandr Hunko on 02/10/2022.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - UI Elements's
    private let backgroundView = UIImageView()
    private let openSlideMenuBtn = UIButton()
    private let slideMenuView = UIImageView()
    private let closeSlideMenuBtn = UIButton()

    // MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBackgroundView()
        setupOpenSlideMenuBtn()
    }
    
    // MARK: - View Will Appear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupBehaviorOpenSlideMenuBtn()
        setupBehaviorCloseSlideMenuBtn()
    }
}

private extension MainViewController {
    
    // MARK: - Setup Background View
    func setupBackgroundView() {
        backgroundView.frame = view.bounds
        backgroundView.image = UIImage(named: "Image2")
        view.addSubview(backgroundView)
    }
    
    // MARK: - Setup Open Slide Menu Btn
    func setupOpenSlideMenuBtn() {
        let xCoordinate = view.bounds.width / 20
        let yCoordinate = view.bounds.height / 15
        
        openSlideMenuBtn.frame = CGRect(x: xCoordinate, y: yCoordinate, width: 25, height: 25)
        openSlideMenuBtn.setImage(UIImage(named: "HamburgerMenu"), for: .normal)
        view.addSubview(openSlideMenuBtn)
    }
    
    // MARK: - Setup Behavior Open Slide Menu Btn
    func setupBehaviorOpenSlideMenuBtn() {
        openSlideMenuBtn.addTarget(self, action: #selector(activeOpenSlideMenuBtn), for: .touchUpInside)
    }
    @objc func activeOpenSlideMenuBtn() {
        setupSlideMenuView()
        setupBlurEffect()
        
        UIView.animate(withDuration: 0.35) {
            self.slideMenuView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width / 2 + 50, height: self.view.frame.height)
        } completion: { _ in
            self.setupCloseSlideMenuBtn()
        }
    }
    
    // MARK: - Setup Slide Menu View
    func setupSlideMenuView() {
        slideMenuView.frame = CGRect(x: 0, y: 0, width: 0, height: view.frame.height)
        slideMenuView.backgroundColor = UIColor(named: "SlideMenuColor")
        view.addSubview(slideMenuView)
    }
    
    // MARK: - Setup Close Slide Menu Btn
    func setupCloseSlideMenuBtn() {
        let xCoordinate = view.bounds.width / 20
        let yCoordinate = view.bounds.height / 15
        
        closeSlideMenuBtn.frame = CGRect(x: xCoordinate, y: yCoordinate, width: 25, height: 25)
        closeSlideMenuBtn.setImage(UIImage(named: "CloseMenu"), for: .normal)
        view.addSubview(closeSlideMenuBtn)
    }
    
    // MARK: - Setup Behavior Close Slide Menu Btn
    func setupBehaviorCloseSlideMenuBtn() {
        closeSlideMenuBtn.addTarget(self, action: #selector(activeCloseSlideMenuBtn), for: .touchUpInside)
    }
    @objc func activeCloseSlideMenuBtn() {
        closeSlideMenuBtn.removeFromSuperview()
        UIView.animate(withDuration: 0.35) {
            self.slideMenuView.frame = CGRect(x: 0, y: 0, width: 0, height: self.view.frame.height)
        }
        removeBlurEffect()
    }
    
    // MARK: - Setup Blur Effect
    func setupBlurEffect() {
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        backgroundView.addSubview(blurEffectView)
    }
    
    // MARK: - Remove Blur Effect
    func removeBlurEffect() {
        for backgroundView in backgroundView.subviews {
            if backgroundView is UIVisualEffectView {
                backgroundView.removeFromSuperview()
            }
        }
    }
}

