//
//  QuestionsView.swift
//  BaseApp
//
//  Created by Shirin on 3/26/23.
//

import UIKit
import EasyPeasy

class QuestionsView: UIView {
    
    var header = Header()
    
    var tableView = UITableView(rowHeight: UITableView.automaticDimension)
    
    var loading: UIActivityIndicatorView = {
        let loading = UIActivityIndicatorView()
        loading.color = .white
        loading.backgroundColor = .black.withAlphaComponent(0.8)
        loading.layer.cornerRadius = 10
        loading.stopAnimating()
        return loading
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        tableView.register(QuestionsTbCell.self, forCellReuseIdentifier: QuestionsTbCell.id)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        addSubview(header)
        header.easy.layout([
            Top().to(safeAreaLayoutGuide, .top), Leading(), Trailing()
        ])
        
        addSubview(tableView)
        tableView.easy.layout([
            Top().to(header, .bottom), Leading(), Trailing(), Bottom().to(safeAreaLayoutGuide, .bottom)
        ])
        
        addSubview(loading)
        loading.easy.layout([
            Center(), Size(80)
        ])
    }
}
