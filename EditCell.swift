//
//  EditCell.swift
//  Reminder
//
//  Created by nguyen.duc.huyb on 7/3/19.
//  Copyright © 2019 nguyen.duc.huyb. All rights reserved.
//

final class EditCell: UICollectionViewCell, NibReusable {
    @IBOutlet private weak var nameEventLabel: UILabel!
    @IBOutlet private weak var dateEventLabel: UILabel!
    @IBOutlet private weak var editView: UIView!
    
    var didEditEvent: (() -> Void)?
    var didDeleteEvent: (() -> Void)?

    func configEditCell(_ event: Event) {
        guard let firstColor = event.firstColor,
            let secondColor = event.secondColor else { return }
        
        nameEventLabel.text = event.eventName
        dateEventLabel.text = event.date?.convertDateFormate()
        editView.setGradientLayer(color1: firstColor, color2: secondColor)
    }

    @IBAction private func handleEditButtonTapped(_ sender: Any) {
        didEditEvent?()
    }
    
    @IBAction private func handleDeleteButtonTapped(_ sender: Any) {
        didDeleteEvent?()
    }
}
