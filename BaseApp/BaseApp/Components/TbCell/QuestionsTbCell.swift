//
//  FaqTbCell.swift
//  BaseApp
//
//  Created by Shirin on 3/26/23.
//

import UIKit
import EasyPeasy

class QuestionsTbCell: UITableViewCell {

    static let id = "FaqTbCell"
    
    var contentStack = UIStackView(axis: .vertical,
                                   alignment: .fill,
                                   spacing: 6,
                                   edgeInsets: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    
    var userDataStack = UIStackView(axis: .horizontal,
                                    alignment: .fill,
                                    spacing: 6)
    
    var avatar: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.image = UIImage(systemName: "person.circle.fill")
        img.easy.layout(Size(40))
        img.layer.cornerRadius = 20
        return img
    }()
    
    var nameStack = UIStackView(axis: .vertical,
                                alignment: .fill,
                                spacing: 0)
    
    var name = UILabel(font: .systemFont(ofSize: 14),
                       color: .secondaryLabel,
                       alignment: .left,
                       numOfLines: 1)
    
    var categoryStack = UIStackView(axis: .horizontal,
                                    alignment: .fill,
                                    spacing: 2)
    
    var categoryName = UILabel(font: .boldSystemFont(ofSize: 12),
                               color: .label,
                               alignment: .left,
                               numOfLines: 1)
    
    var subCategoryNAme = UILabel(font: .systemFont(ofSize: 12),
                                  color: .tertiaryLabel,
                                  alignment: .left,
                                  numOfLines: 1)

    var bookmarkBtn = IconBtn(iconName: "bookmark")
    
    var question = UILabel(font: .systemFont(ofSize: 14),
                           color: .secondaryLabel,
                           alignment: .left,
                           numOfLines: 0)
    
    var btnStack = UIStackView(axis: .horizontal,
                               alignment: .fill,
                               spacing: 10)
    
    var upBtn = IconTextBtn(title: "1", iconName: "arrow.up", withBorder: true)
    
    var downBtn = IconTextBtn(title: "1", iconName: "arrow.down")
    
    var commentsBtn = IconTextBtn(title: "1", iconName: "text.bubble")
    
    var date =  UILabel(font: .systemFont(ofSize: 14),
                        color: .secondaryLabel,
                        alignment: .left,
                        numOfLines: 0)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupView()
        setupContentStack()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    func setupView(){
        backgroundColor = .clear
        selectionStyle = .none
        contentView.addSubview(contentStack)
        contentStack.easy.layout([
            Top(20), Leading(20), Trailing(20), Bottom()
        ])
    }
    
    func setupContentStack(){
        contentStack.addBackground(color: .clear,
                                   cornerRadius: 5,
                                   borderWidth: 1,
                                   borderColor: .tertiaryLabel)
        
        contentStack.addArrangedSubviews([userDataStack,
                                          question,
                                          btnStack])
        
        contentStack.setCustomSpacing(16, after: question)
        
        setupUserDataStack()
        setupBtnStack()
    }
    
    func setupUserDataStack(){
        userDataStack.addArrangedSubviews([avatar,
                                           nameStack,
                                           bookmarkBtn])
        
        nameStack.addArrangedSubviews([name,
                                       categoryStack])
        
        categoryStack.addArrangedSubviews([categoryName,
                                           subCategoryNAme])
        
        categoryName.setContentHuggingPriority(.required, for: .horizontal)
    }
    
    func setupBtnStack(){
        btnStack.addArrangedSubviews([upBtn,
                                      downBtn,
                                      commentsBtn,
                                      UIView(),
                                      date])
    }
    
    func setupData(data: Faq?){
        guard let data = data else { return }
        name.text = data.owner.name
        bookmarkBtn.setImage(UIImage(systemName: data.is_bookmarked ? "bookmark-filled" : "bookmark"),
                             for: .normal)
        
        categoryName.text = data.category.name
        question.text = data.question
        upBtn.title.text = "\(data.up_vote)"
        downBtn.title.text = "\(data.down_vote)"
        commentsBtn.title.text = "\(data.answer_count )"
        date.text = data.created_at.timeAgoDisplay()
    }
}
