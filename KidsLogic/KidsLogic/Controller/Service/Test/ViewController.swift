
import UIKit

class TestViewController: UIViewController {
    @IBOutlet weak var questionCounter: UILabel?
    @IBOutlet weak var scoreLabel: UILabel?
    @IBOutlet weak var progressView: UIView?
    @IBOutlet weak var flagView: UIImageView?
    @IBOutlet weak var questionLabel: UILabel?
    
    //Outlet for Buttons
    @IBOutlet weak var optionA: UIButton?
    @IBOutlet weak var optionB: UIButton?
    @IBOutlet weak var optionC: UIButton?
    @IBOutlet weak var optionD: UIButton?
    
    let allQuestions = QuestionBank()
    var questionNumber: Int = 0
    var score: Int = 0
    var selectedAnswer: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateQuestion()
        updateUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func answerPressed(_ sender: UIButton) {
        if sender.tag == selectedAnswer {
//            ProgressHUD.showSuccess
            print("Correct")
            score += 1
            
        }else{
//            ProgressHUD.showError
            print("Incorrect")
            
            
        }
        
        questionNumber += 1
        updateQuestion()
        
    }
    
    func updateQuestion(){
        
        if questionNumber <= allQuestions.list.count - 1{
            flagView?.image = UIImage(named:(allQuestions.list[questionNumber].questionImage ?? ""))
            questionLabel?.text = allQuestions.list[questionNumber].question
            optionA?.setTitle(allQuestions.list[questionNumber].optionA, for: UIControl.State.normal)
            optionB?.setTitle(allQuestions.list[questionNumber].optionB, for: UIControl.State.normal)
            optionC?.setTitle(allQuestions.list[questionNumber].optionC, for: UIControl.State.normal)
            optionD?.setTitle(allQuestions.list[questionNumber].optionD, for: UIControl.State.normal)
            selectedAnswer = allQuestions.list[questionNumber].correctAnswer ?? 0
            updateUI()
            
        }else {
            let alert = UIAlertController(title: "Awesome", message: "End of Quiz. Do you want to start over?", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: {action in self.restartQuiz()})
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }
        
        
    }
    
    func updateUI(){
        scoreLabel?.text = "Score: \(score) "
        questionCounter?.text = "\(questionNumber + 1)/\(allQuestions.list.count)"
        progressView?.frame.size.width = (view.frame.size.width / CGFloat(allQuestions.list.count)) * CGFloat(questionNumber + 1)
        
    }
    
    func restartQuiz(){
        score = 0
        questionNumber = 0
        updateQuestion()
        
    }
    


}

