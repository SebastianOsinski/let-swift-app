//
//  OnboardingCardView.swift
//  LetSwift
//
//  Created by Marcin Chojnacki on 12.05.2017.
//  Copyright © 2017 Droids On Roids. All rights reserved.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//       http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

import UIKit

final class SpeakerCardView: DesignableView, Localizable {
    
    @IBOutlet private weak var speakerCellView: TappableView!
    @IBOutlet private weak var indicatorImageView: UIImageView!
    @IBOutlet private weak var speakerImageView: UIImageView!
    @IBOutlet private weak var speakerNameLabel: AppLabel!
    @IBOutlet private weak var speakerTitleLabel: AppLabel!
    @IBOutlet private weak var lectureTitleLabel: AppLabel!
    @IBOutlet private weak var lectureSummaryLabel: AppLabel!
    @IBOutlet private weak var readMoreButton: UIButton!
    
    @IBOutlet private weak var upperSeparatorConstraint: NSLayoutConstraint!
    @IBOutlet private weak var lowerSeparatorConstraint: NSLayoutConstraint!
    
    var speakerImageURL: URL? {
        didSet {
            speakerImageView.setImage(url: speakerImageURL, errorPlaceholder: speakerImageView.image)
        }
    }
    
    var speakerName: String? {
        get {
            return speakerNameLabel.text
        }
        set {
            speakerNameLabel.text = newValue
        }
    }
    
    var speakerTitle: String? {
        get {
            return speakerTitleLabel.text
        }
        set {
            speakerTitleLabel.text = newValue
        }
    }
    
    var lectureTitle: String? {
        get {
            return lectureTitleLabel.text
        }
        set {
            lectureTitleLabel.text = newValue
        }
    }
    
    var lectureSummary: String? {
        get {
            return lectureSummaryLabel.text
        }
        set {
            lectureSummaryLabel.text = newValue
        }
    }
    
    var isSpeakerCellTappable = true {
        didSet {
            speakerCellView.selectionColor = isSpeakerCellTappable ? .lightBlueGrey : nil
            indicatorImageView.isHidden = !isSpeakerCellTappable
        }
    }
    
    override func loadViewFromNib() {
        super.loadViewFromNib()
        
        setupLocalization()
        
        upperSeparatorConstraint.constant = 1.0 / UIScreen.main.scale
        lowerSeparatorConstraint.constant = upperSeparatorConstraint.constant
        
        addShadow(opacity: 0.1, offset: CGSize(width: 0.0, height: 5.0), radius: 10.0)
    }
    
    func setupLocalization() {
        readMoreButton.setTitle(localized("LECTURE_READ_MORE").uppercased(), for: [])
    }

    func addSpeakerTapTarget(target: Any?, action: Selector) {
        speakerCellView.addTarget(target, action: action)
    }
    
    func addReadMoreTapTarget(target: Any?, action: Selector) {
        readMoreButton.addTarget(target, action: action, for: .touchUpInside)
    }
}
