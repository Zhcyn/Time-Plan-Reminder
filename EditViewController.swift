//
//  EditViewController.swift
//  Reminder
//
//  Created by nguyen.duc.huyb on 7/3/19.
//  Copyright © 2019 nguyen.duc.huyb. All rights reserved.
//

final class EditViewController: UIViewController {
    @IBOutlet private weak var editCollectionView: UICollectionView!
    @IBOutlet private weak var introLabel: UILabel!
    
    private var viewModel: EditViewModel!
    private var notificationToken: NotificationToken?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
        configRealm()
    }
    
    deinit {
        notificationToken?.invalidate()
        RealmService.shared.stopObservingErrors(in: self)
    }
    
    private func config() {
        viewModel = EditViewModel()
        editCollectionView.delegate = viewModel
        editCollectionView.dataSource = viewModel
        editCollectionView.register(UINib(nibName: "EditCell", bundle: nil), forCellWithReuseIdentifier: "EditCell")
        
        if viewModel.count == 0 {
            introLabel.isHidden = false
            editCollectionView.isHidden = true
        } else {
            introLabel.isHidden = true
            editCollectionView.isHidden = false
        }
        
        // Config Navigation Bar
        navigationItem.title = "Edit"
        navigationController?.navigationBar.tintColor = UIColor(hexString: "7CD0F1")
        let closeButton = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(handleCloseButtonTapped))
        navigationItem.rightBarButtonItem  = closeButton
        
        viewModel.didMoveToNextPage = { [weak self] index in
            guard let self = self else { return }
            let vc = EditDetailViewController.instantiate()
            vc.currentEvent = self.viewModel[index]
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    private func configRealm() {
        notificationToken = RealmService.shared.realmDB?.observe({ [unowned self] (notification, realm) in
            self.editCollectionView.reloadData()
            
            if self.viewModel.count == 0 {
                self.introLabel.isHidden = false
                self.editCollectionView.isHidden = true
            } else {
                self.introLabel.isHidden = true
                self.editCollectionView.isHidden = false
            }
        })
        
        configRealmError()
    }
    
    @objc
    private func handleCloseButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
}

extension EditViewController: StoryboardSceneBased {
    static var sceneStoryboard = Storyboards.main
}
