//
//  QuestionsVC.swift
//  BaseApp
//
//  Created by Shirin on 3/26/23.
//

import UIKit

class QuestionsVC: UIViewController {

    let viewModel = QuestionsVM()
    
    var mainView: QuestionsView {
        return view as! QuestionsView
    }

    override func loadView() {
        super.loadView()
        view = QuestionsView()
        view.backgroundColor = .white
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        mainView.tableView.dataSource = self
        
        setupBindings()
        
        viewModel.getData()
    }
    
    func setupBindings(){
        viewModel.questions.bind { [weak self] resp in
            self?.mainView.tableView.reloadData()
        }
        
        viewModel.inProgress.bind { [weak self] inProgress in
            if inProgress {
                self?.mainView.loading.startAnimating()
            } else {
                self?.mainView.loading.stopAnimating()
            }
        }
    }
}

extension QuestionsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.questions.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: QuestionsTbCell.id, for: indexPath) as! QuestionsTbCell
        cell.setupData(data: viewModel.questions.value[indexPath.row])
        return cell
    }
}
