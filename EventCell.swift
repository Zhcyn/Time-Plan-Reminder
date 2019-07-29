//
//  EventCell.swift
//  Reminder
//
//  Created by nguyen.duc.huyb on 6/27/19.
//  Copyright © 2019 nguyen.duc.huyb. All rights reserved.
//

final class EventCell: UICollectionViewCell, NibReusable {
    @IBOutlet private weak var dateLeftView: UIView!
    @IBOutlet private weak var eventView: UIView!
    @IBOutlet private weak var eventNameLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var dateLeftLabel: UILabel!
    @IBOutlet private weak var timeLeftLabel: UILabel!
    
    private var date: Date!
    private var timer = Timer()
    private var timeLeft: Int!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        dateLeftView.dropShadow()
    }
    
    func configCell(_ event: Event) {
        guard let firstColor = event.firstColor,
            let secondColor = event.secondColor,
            let eventDate = event.date,
            let eventDay = event.date?.convertToDate()?.days else { return }
        
        self.date = eventDate
        self.timeLeft = Int(eventDate.timeIntervalSinceNow)
        
        eventView.setGradientLayer(color1: firstColor, color2: secondColor)
        eventNameLabel.text = event.eventName
        dateLabel.text = event.date?.convertDateFormate()
        
        // Check if eventDate > currentDate
        if date > Date()  {
            dateLeftView.backgroundColor = .white
            dateLeftLabel.textColor = .black
            timeLeftLabel.textColor = .black
        } else {
            timeLeftLabel.text = "Timeout 00:00:00"
            dateLeftLabel.addDateAttributedText("0")
            
            dateLeftView.backgroundColor = UIColor(hexString: Constant.alertColor.rawValue)
            dateLeftLabel.textColor = .white
            timeLeftLabel.textColor = .white
            return
        }
        
        timeLeftLabel.text = eventDate.convertToDate()?.times
        
        if eventDay == "00" {
            dateLeftLabel.addDateAttributedText("0")
        } else {
            dateLeftLabel.addDateAttributedText(eventDay)
        }
    
        setupTimer()
    }
    
    private func setupTimer() {
        guard timeLeft > 0 else { return }
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(counter), userInfo: nil, repeats: true)
    }
    
    @objc
    private func counter() {
        timeLeft -= 1
        
        guard let eventDay = date.convertToDate()?.days else { return }
        
        timeLeftLabel.text = date.convertToDate()?.times
        if eventDay == "00" {
            dateLeftLabel.addDateAttributedText("0")
        } else {
            dateLeftLabel.addDateAttributedText(eventDay)
        }
        
        if date <= Date() {
            timeLeftLabel.text = "00:00:00"
            dateLeftLabel.addDateAttributedText("0")
            dateLeftView.backgroundColor = UIColor(hexString: Constant.alertColor.rawValue)
            dateLeftLabel.textColor = .white
            timeLeftLabel.textColor = .white
            timer.invalidate()
        }
    }
}
