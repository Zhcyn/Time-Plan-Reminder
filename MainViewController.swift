//
//  ViewController.swift
//  Reminder
//
//  Created by nguyen.duc.huyb on 6/27/19.
//  Copyright © 2019 nguyen.duc.huyb. All rights reserved.
//

import UserNotifications

final class MainViewController: UIViewController {
    @IBOutlet private weak var eventsCollectionView: UICollectionView!
    @IBOutlet private weak var introLabel: UILabel!
    
    private var viewModel: MainViewModel!
    private var notificationToken: NotificationToken?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestLocalAuthority()
        config()
        configRealm()
    }
    
    private func requestLocalAuthority() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (success, error) in
            guard success else {
                print("Request Authorization Failed \(error?.localizedDescription ?? "")")
                return
            }
        }
    }
    
    deinit {
        notificationToken?.invalidate()
        RealmService.shared.stopObservingErrors(in: self)
    }

    private func config() {
        viewModel = MainViewModel()
        eventsCollectionView.delegate = viewModel
        eventsCollectionView.dataSource = viewModel
        
        if viewModel.count == 0 {
            introLabel.isHidden = false
            eventsCollectionView.isHidden = true
        } else {
            introLabel.isHidden = true
            eventsCollectionView.isHidden = false
        }
        
        eventsCollectionView.register(UINib(nibName: "EventCell", bundle: nil), forCellWithReuseIdentifier: "EventCell")
    }
    
    private func configRealm() {
        notificationToken = RealmService.shared.realmDB?.observe({ [unowned self] (notification, realm) in
            self.eventsCollectionView.reloadData()
            if self.viewModel.count == 0 {
                self.introLabel.isHidden = false
                self.eventsCollectionView.isHidden = true
            } else {
                self.introLabel.isHidden = true
                self.eventsCollectionView.isHidden = false
            }
        })
        
        configRealmError()
    }
    
    @IBAction func handleEditButtonTapped(_ sender: Any) {
        let vc = EditViewController.instantiate()
        let navigationController = NavigationViewController(rootViewController: vc)
        present(navigationController, animated: true)
    }
    
    @IBAction func handleAddButtonTapped(_ sender: Any) {
        let vc = CreateViewController.instantiate()
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func handleSettingButtonTapped(_ sender: Any) {
        let vc = SettingsViewController.instantiate()
        present(vc, animated: true, completion: nil)
    }
}

