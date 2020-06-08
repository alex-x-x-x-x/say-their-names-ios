//
//  AboutView.swift
//  SayTheirNames
//
//  Copyright (c) 2020 Say Their Names Team (https://github.com/Say-Their-Name)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import UIKit

/// The UI for More
final class MoreView: UIView {
    
    private lazy var aboutCard: UIView = {
        let logo = UIImageView(image: UIImage(named: "logo"))
        
        let label = UILabel()
        label.text = "SAY THEIR NAME"
        label.textColor = UIColor.STN.white
        label.font = UIFont.STN.bannerTitle
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let header = UIStackView(arrangedSubviews: [logo, label])
        header.axis = .horizontal
        header.alignment = .center
        header.spacing = 8
        header.translatesAutoresizingMaskIntoConstraints = false
        
        let hashTag = UILabel()
        hashTag.text = "#BLACKLIVESMATTER"
        hashTag.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        hashTag.textColor = .white
        hashTag.adjustsFontSizeToFitWidth = true
        hashTag.numberOfLines = Theme.Components.LineLimit.single
        hashTag.translatesAutoresizingMaskIntoConstraints = false
        
        let vStack = UIStackView(arrangedSubviews: [header, hashTag])
        vStack.axis = .vertical
        vStack.alignment = .center
        vStack.spacing = 10
        vStack.translatesAutoresizingMaskIntoConstraints = false
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .black
        imageView.addSubview(vStack)
        
        NSLayoutConstraint.activate([
            vStack.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            vStack.centerYAnchor.constraint(equalTo: imageView.centerYAnchor),
        ])
        
        return imageView
    }()
    
    private lazy var thankYouLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.STN.primaryLabel
        label.font = UIFont.STN.ctaTitle
        label.numberOfLines = Theme.Components.LineLimit.double
        label.text = Strings.massiveThankYou
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.STN.white
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    /// Configures constraints for subviews
    private func setupSubviews() {
        let contentView = UIStackView(
            arrangedSubviews:
            [aboutCard,
             historySection(),
             developerSection(),
             designerSection(),
             thankYouLabel])
        
        contentView.axis = .vertical
        contentView.spacing = Theme.Components.Padding.extraLarge
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        // scroll view
        let scrollView = UIScrollView(frame: frame)
        scrollView.addSubview(contentView)
        addSubview(scrollView)
        
        scrollView.anchor(superView: self, top: topAnchor, leading: leadingAnchor,
                          bottom: bottomAnchor, trailing: trailingAnchor, padding: .zero, size: .zero)
        contentView.anchor(superView: scrollView, top: scrollView.topAnchor, leading: nil,
                           bottom: nil, trailing: nil,
                           padding: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20), size: .zero)
        
        NSLayoutConstraint.activate([
            aboutCard.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20),
            aboutCard.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            aboutCard.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            aboutCard.heightAnchor.constraint(equalToConstant: 150),
            thankYouLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
    }
}

// MARK: - Configurations
private extension MoreView {
        
    private func historySection() -> UIStackView {
        let stackCard = UIStackView(arrangedSubviews: [titleLabel(.history), descriptionLable(.history)])
        stackCard.axis = .vertical
        stackCard.spacing = Theme.Components.Padding.small
        stackCard.translatesAutoresizingMaskIntoConstraints = false
        
        return stackCard
    }
    
    private func developerSection() -> UIStackView {
        let stackCard = UIStackView(arrangedSubviews: [titleLabel(.developer), descriptionLable(.developer), actionButton(.developer)])
        stackCard.axis = .vertical
        stackCard.spacing = Theme.Components.Padding.small
        stackCard.translatesAutoresizingMaskIntoConstraints = false
        
        return stackCard
    }
    
    private func designerSection() -> UIStackView {
        let stackCard = UIStackView(arrangedSubviews: [titleLabel(.designer), descriptionLable(.designer), actionButton(.designer)])
        stackCard.axis = .vertical
        stackCard.spacing = Theme.Components.Padding.small
        stackCard.translatesAutoresizingMaskIntoConstraints = false
        
        return stackCard
    }
    
    private func titleLabel(_ section: section) -> UILabel {
        let titleLabel = UILabel()
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = UIColor.STN.primaryLabel
        titleLabel.font = UIFont.STN.ctaTitle
        titleLabel.numberOfLines = Theme.Components.LineLimit.double
        
        switch section {
        case .history:
            titleLabel.text = Strings.MoreHistory.title
        case .developer:
            titleLabel.text = Strings.GetInvolvedDev.title
        case .designer:
            titleLabel.text = Strings.GetInvolvedDesign.title
        }
        return titleLabel
    }
    
    private func descriptionLable(_ section: section) -> UILabel {
        let bodyLabel = UILabel()
        
        bodyLabel.translatesAutoresizingMaskIntoConstraints = false
        bodyLabel.textColor = UIColor.STN.primaryLabel
        bodyLabel.font = UIFont.STN.ctaBody
        bodyLabel.numberOfLines = Theme.Components.LineLimit.quintuple
        
        switch section {
        case .history:
            bodyLabel.text = "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturiasdlnalkd."
        case .developer:
            bodyLabel.text = "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis"
        case .designer:
            bodyLabel.text = "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis"
        }
        
        return bodyLabel
    }
    
    private func actionButton(_ section: section) -> UIButton {
        let actionButton = UIButton()
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        actionButton.layer.backgroundColor = UIColor.STN.actionButton.cgColor
        actionButton.titleLabel?.font = UIFont.STN.sectionHeader
        actionButton.layer.borderWidth = 2
        actionButton.tintColor = UIColor.STN.actionButton
        actionButton.setTitleColor(UIColor.STN.white, for: .normal)
        actionButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        switch section {
        case .developer:
            actionButton.setTitle(Strings.viewRepo, for: .normal)
        case .designer:
            actionButton.setTitle(Strings.joinSlack, for: .normal)
        case .history: break
        }
        
        return actionButton
    }
    
    enum section {
        case developer, designer, history
    }
    
}