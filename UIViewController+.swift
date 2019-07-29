//
//  UIViewController+.swift
//  Reminder
//
//  Created by nguyen.duc.huyb on 7/3/19.
//  Copyright © 2019 nguyen.duc.huyb. All rights reserved.
//

extension UIViewController {
    func hideDatePickerWhenTapped() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGestureRecognizer))
        tapGesture.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc
    private func handleTapGestureRecognizer(_ gesture: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    func showAlert(title: String?, message: String?) {
        let ac = UIAlertController(title: title,
                                   message: message,
                                   preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel)
        
        ac.addAction(okAction)
        present(ac, animated: true, completion: nil)
    }
    
    func configRealmError() {
        //Handle Realm Error
        RealmService.shared.observeRealmErrors(in: self) { [weak self] (error) in
            guard let self = self else { return }
            self.showAlert(title: "Error", message: error?.localizedDescription ?? "no error detected")
        }
    }
}
