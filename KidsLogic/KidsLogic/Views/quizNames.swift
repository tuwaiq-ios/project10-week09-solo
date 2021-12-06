
//  quiz.swift
//  web view
//
//  Created by sara saud on 20/04/1443 AH.
//

import Foundation
import UIKit


struct Qustion {
    var questionString: String?
    var answers: [String]?
    var selectedAnswerIndex: Int?
    
}

class quiz: UITableViewController  {
    
    let cellId = "cellId"
    let headerId = "headerId"
    var question = Qustion(questionString: "What is 1+1", answers: ["1","2","3","4","1","2","3","4"],selectedAnswerIndex: 1)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "DarkColor")
        
        navigationItem.title = "Quiz 🔰"
        view.backgroundColor = UIColor(named: "DarkColor")
        navigationController?.navigationBar.tintColor = .white
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back ↩︎", style: .plain, target: nil, action: nil)
        tableView.register(AnswerCell.self, forCellReuseIdentifier: cellId)
        tableView.register(QuestionHeader.self, forHeaderFooterViewReuseIdentifier: headerId)
        tableView.sectionHeaderHeight = 200
        tableView.tableFooterView = UIView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = question.answers?.count {
            return count
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)as! AnswerCell
        cell.nameLabel.text = question.answers?[indexPath.row]
        return cell
    }
                           
                           
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "headerId")as! QuestionHeader
        header.nameLabel.text = question.questionString
        return header
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        question.selectedAnswerIndex = indexPath.row
        
        let controller = ReusltsController()
        controller.question = question
        navigationController?.pushViewController(controller, animated: true)
    }
    
    class ReusltsController: UIViewController{
        var question: Qustion? {
            didSet {
                let names = ["sa","dd","ww","ee","rr","qq","sa","dd","ww","ee","rr","qq"]
                let result = names[question!.selectedAnswerIndex!]
                resultLabel.text = "congratulation\(result)!"
                     
                print(question?.selectedAnswerIndex)
            }
        }
        let resultLabel: UILabel = {
            let label = UILabel()
            label.text = "🥇win"
            label.textAlignment = .center
            label.font = UIFont.boldSystemFont(ofSize: 30)
            label.translatesAutoresizingMaskIntoConstraints = false
            
            return label
        }()
        override func viewDidLoad() {
            super.viewDidLoad()
            navigationItem.title = "Results 💡"
            view.backgroundColor = UIColor.gray
            
            view.addSubview(resultLabel)
            NSLayoutConstraint.activate([
                resultLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -100),
                resultLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 500),
                resultLabel.widthAnchor.constraint(equalToConstant: 200),
                resultLabel.heightAnchor.constraint(equalToConstant: 40),
            ])
        }
    }
    
}
                           
    class QuestionHeader: UITableViewHeaderFooterView{
            override init(reuseIdentifier: String?){
                super.init(reuseIdentifier: reuseIdentifier)
                setUpViews()
            }
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
    }
                let nameLabel: UILabel = {
                    let lable = UILabel()
                    lable.text = "sample question !!"
                    lable.font = UIFont.systemFont(ofSize: 30)
                    lable.textColor = .green
                    return lable
                }()
            
            func setUpViews() {
                addSubview(nameLabel)
                NSLayoutConstraint.activate([
                    nameLabel.rightAnchor.constraint(equalTo: nameLabel.rightAnchor, constant: -100),
                    nameLabel.topAnchor.constraint(equalTo: nameLabel.topAnchor, constant: 500),
                    nameLabel.widthAnchor.constraint(equalToConstant: 200),
                    nameLabel.heightAnchor.constraint(equalToConstant: 40),
                ])
            }
                
            
            required init?(coderr: NSCoder) {
                fatalError("init(coder:) has not been implemented")
        }
//
    }
    class AnswerCell: UITableViewCell {
     
        
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            
            setUpViews()
        }
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
    }
        
        let nameLabel: UILabel = {
            let lable = UILabel()
            lable.text = "sample Answer !!"
            lable.font = UIFont.systemFont(ofSize: 30)
            lable.textColor = .green
            return lable
        }()
    
    func setUpViews() {
        addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.rightAnchor.constraint(equalTo: nameLabel.rightAnchor, constant: -100),
            nameLabel.topAnchor.constraint(equalTo: nameLabel.topAnchor, constant: 500),
            nameLabel.widthAnchor.constraint(equalToConstant: 200),
            nameLabel.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
}
