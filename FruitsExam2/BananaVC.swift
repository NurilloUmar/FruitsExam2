


import UIKit

class BananaVC: UIViewController {
    
    @IBOutlet weak var bananasLbl: UILabel!{
        didSet{
            bananasLbl.layer.cornerRadius = bananasLbl.bounds.height/2-4
            bananasLbl.clipsToBounds = true
        }

    }
    @IBOutlet weak var bananasC50: NSLayoutConstraint!
    @IBOutlet weak var plusLbl: UILabel!
    @IBOutlet weak var askLbl: UILabel!
    @IBOutlet var zeroBtns: [UIButton]!
    @IBOutlet weak var nextBtn: UIButton!{
        didSet{
            nextBtn.layer.cornerRadius = nextBtn.bounds.height/2-4
        }
    }
    @IBOutlet weak var nextCons50: NSLayoutConstraint!
    @IBOutlet weak var bottomCons100: NSLayoutConstraint!
    
    @IBOutlet weak var resultLbl: UILabel!
    var step : Int = 0
    
    @IBOutlet var firstImg: [UIImageView]!
    @IBOutlet var secondImg: [UIImageView]!
    
    
    
    @IBOutlet weak var restartBtn: UIButton!{
        didSet{
            restartBtn.layer.cornerRadius = restartBtn.bounds.height/2-4
        }

    }
    
    @IBOutlet weak var homeBtn: UIButton!{
        didSet{
            homeBtn.layer.cornerRadius = homeBtn.bounds.height/2-4
        }
    }
    
    
    @IBOutlet weak var resultView: UIView!
    var questions : [Question] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        flexibleScreen()
        restart()
    }
    
    
    func restart(){
        step = 0
        resultView.isHidden = true
        self.questions.removeAll()
        
        for _ in 1...10 {
            questions.append(Question())
        }
        let firstQuestion = questions.first!
        for (i,btn) in zeroBtns.enumerated(){
            btn.isEnabled = true
            btn.setTitleColor(.white, for: .normal)
            btn.setTitle("\(firstQuestion.variants[i])", for: .normal)
        }
        for i in 0...4{
            let firstI = firstImg[i]
            firstI.isHidden = !( firstQuestion.firstNum > i)
            let secondI = secondImg[i]
            secondI.isHidden = !(firstQuestion.secondNum > i)
        }
        
        
    }
    func flexibleScreen(){
        
        if UIScreen.main.bounds.height <= 720{
            bananasC50.constant = 40
            nextCons50.constant = 40
            for i in zeroBtns{
                i.titleLabel?.font = UIFont.systemFont(ofSize: 40, weight: .bold)
            }
            plusLbl.font = UIFont.systemFont(ofSize: 40, weight: .bold)
            askLbl.font = UIFont.systemFont(ofSize: 40, weight: .bold)
            bottomCons100.constant = 70
            
        
        }
    }
    
    @IBAction func nextPressed(_ sender: Any) {
        
        if step<9 {
            let nextQuestion = questions[step+1]
            for (i,btn) in zeroBtns.enumerated(){
                btn.isEnabled = true
                btn.setTitleColor(.white, for: .normal)
                btn.setTitle("\(nextQuestion.variants[i])", for: .normal)
            }
            
            for i in 0...4{
                let firstI = firstImg[i]
                firstI.isHidden = !( nextQuestion.firstNum > i)
                let secondI = secondImg[i]
                secondI.isHidden = !(nextQuestion.secondNum > i)
            }
            step+=1
        }else {
            var correctAnswers = 0
            for i in questions{
                if let choosen = i.choosenAnswer{
                    if choosen==i.rightAnswer{
                        correctAnswers+=1
                    }
                }
            }
            self.resultLbl.text = "\(correctAnswers)/\(questions.count)"
            resultView.isHidden = false
        }
    }
    
    
    @IBAction func btnChoosen(_ sender: UIButton) {
        
        let currentQuestion = questions[step]
        
        if sender.currentTitle! != "\(currentQuestion.choosenAnswer)"{
            sender.setTitleColor(.red, for: .normal)
        }
        for b in zeroBtns{
            b.isEnabled = false
            
            if b.currentTitle! == "\(currentQuestion.rightAnswer)"{
                b.setTitleColor(.green, for: .normal)
            }
        }
        questions[step].choosenAnswer = Int(sender.currentTitle!)
    }
    
    
    @IBAction func restartPressed(_ sender: Any) {
        restart()
    }
    
    @IBAction func homePressed(_ sender: Any) {
        dismiss(animated: true, completion: nil )
    }
    
    
}
