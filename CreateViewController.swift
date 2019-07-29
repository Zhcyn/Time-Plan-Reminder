//
//  CreateViewController.swift
//  Reminder
//
//  Created by nguyen.duc.huyb on 7/2/19.
//  Copyright © 2019 nguyen.duc.huyb. All rights reserved.
//

final class CreateViewController: UIViewController {
    @IBOutlet private weak var colorCollectionView: UICollectionView!
    @IBOutlet private weak var nameEventTextField: UITextField!
    @IBOutlet private weak var dateEventTextField: UITextField!
    
    private var datePicker: UIDatePicker!
    private var viewModel: CreateViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
        setupDatePicker()
        hideDatePickerWhenTapped()
    }
    
    private func config() {
        viewModel = CreateViewModel()
        colorCollectionView.delegate = viewModel
        colorCollectionView.dataSource = viewModel
        colorCollectionView.register(UINib(nibName: "ColorCell", bundle: nil), forCellWithReuseIdentifier: "ColorCell")
        
        viewModel.didChange = { [weak self] in
            guard let self = self else { return }
            self.colorCollectionView.reloadData()
        }
        
        nameEventTextField.setUnderline()
        dateEventTextField.setUnderline()
    }
    
    private func setupDatePicker() {
        datePicker = UIDatePicker()
        datePicker?.locale = Locale(identifier: "en_GB")
        datePicker?.datePickerMode = .dateAndTime
        datePicker?.addTarget(self, action: #selector(handleDatePickerValueChanged), for: .valueChanged)
        dateEventTextField.inputView = datePicker
        dateEventTextField.text = datePicker.date.convertTimeFormate() + " - " + datePicker.date.convertDateFormate()
    }
    
    @objc
    func handleDatePickerValueChanged(_ datePicker: UIDatePicker) {
        dateEventTextField.text = datePicker.date.convertTimeFormate() + " - " + datePicker.date.convertDateFormate()
    }
    
    @IBAction func handleCreateButtonTapped(_ sender: Any) {
        guard let newEventName = nameEventTextField.text,
            let newDate = datePicker?.date.createDateEvent() else { return }
        
        guard newEventName.removeWhitespace() != "" else {
            showAlert(title: "Message", message: "Please fill your event's name")
            return
        }
        
        viewModel.createEvent(eventName: newEventName, date: newDate)
        NotificationManager.shared.setupLocalNotification(newDate, message: newEventName)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func handleCancelButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension CreateViewController: UITextFieldDelegate {
    // Prevent user input in textfield
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == dateEventTextField {
            return false
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameEventTextField {
            view.endEditing(true)
            return true
        }
        return false
    }
}

extension CreateViewController: UIScrollViewDelegate {
    // If content < frame -> disable scrolling
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        if scrollView.contentSize.height <= scrollView.frame.size.height {
            scrollView.isScrollEnabled = false
        } else {
            scrollView.isScrollEnabled = true
        }
    }
}

extension CreateViewController: StoryboardSceneBased {
    static var sceneStoryboard = Storyboards.main
}
