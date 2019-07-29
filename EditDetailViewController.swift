//
//  EditDetailViewController.swift
//  Reminder
//
//  Created by nguyen.duc.huyb on 7/3/19.
//  Copyright © 2019 nguyen.duc.huyb. All rights reserved.
//

final class EditDetailViewController: UIViewController {
    @IBOutlet private weak var colorsCollectionView: UICollectionView!
    @IBOutlet private weak var dateTimeTextField: UITextField!
    @IBOutlet private weak var nameEventTextField: UITextField!
    
    private var viewModel: EditDetailViewModel!
    private var datePicker: UIDatePicker?
    var currentEvent: Event?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
        setupDatePicker()
        hideDatePickerWhenTapped()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    private func config() {
        viewModel = EditDetailViewModel()
        viewModel.didChange = { [weak self] in
            guard let self = self else { return }
            self.colorsCollectionView.reloadData()
        }
        
        colorsCollectionView.delegate = viewModel
        colorsCollectionView.dataSource = viewModel
        colorsCollectionView.register(UINib(nibName: "ColorCell", bundle: nil), forCellWithReuseIdentifier: "ColorCell")
        
        guard let event = currentEvent else { return }
        viewModel.setupData(event)
        
        nameEventTextField.setUnderline()
        dateTimeTextField.setUnderline()
        
        guard let eventName = currentEvent?.eventName,
            let eventTime = currentEvent?.date?.convertTimeFormate(),
            let eventDate = currentEvent?.date?.convertDateFormate() else { return }
        nameEventTextField.text = eventName
        dateTimeTextField.text = eventTime + " - " + eventDate
    }
    
    private func setupDatePicker() {
        guard let date = currentEvent?.date else { return }
        datePicker = UIDatePicker()
        datePicker?.locale = Locale(identifier: "en_GB")
        datePicker?.date = date
        datePicker?.datePickerMode = .dateAndTime
        datePicker?.addTarget(self, action: #selector(handleDatePickerValueChanged), for: .valueChanged)
        dateTimeTextField.inputView = datePicker
    }
    
    @objc
    func handleDatePickerValueChanged(_ datePicker: UIDatePicker) {
        dateTimeTextField.text = datePicker.date.convertTimeFormate() + " - " + datePicker.date.convertDateFormate()
    }
    
    @IBAction func handleSaveButtonTapped(_ sender: Any) {
        guard let curEvent = currentEvent,
            let newEventName = nameEventTextField.text,
            let newDate = datePicker?.date.createDateEvent() else { return }
        
        guard newEventName.removeWhitespace() != "" else {
            showAlert(title: "Message", message: "Please fill your event's name")
            return
        }
        
        viewModel.updateEvent(oldEvent: curEvent, newEventName: newEventName, newDate: newDate)
        NotificationManager.shared.setupLocalNotification(newDate, message: newEventName)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func handleCancelButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

extension EditDetailViewController: UITextFieldDelegate {
    // Prevent user input in textfield
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == dateTimeTextField {
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

extension EditDetailViewController: UIScrollViewDelegate {
    // If content < frame -> disable scrolling
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        if scrollView.contentSize.height <= scrollView.frame.size.height {
            scrollView.isScrollEnabled = false
        } else {
            scrollView.isScrollEnabled = true
        }
    }
}

extension EditDetailViewController: StoryboardSceneBased {
    static var sceneStoryboard = Storyboards.main
}
