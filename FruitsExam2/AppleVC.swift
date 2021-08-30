


import UIKit

class AppleVC: UIViewController {
 
    @IBOutlet weak var appleLbl: UILabel!{
        didSet{
            appleLbl.layer.cornerRadius = appleLbl.bounds.height/2-4
            appleLbl.clipsToBounds = true
        }
    }
    
    @IBOutlet weak var questionLbl: UILabel!
    @IBOutlet weak var bananasC50: NSLayoutConstraint!
    
    @IBOutlet weak var plusLbl: UILabel!
    
    
    
    @IBOutlet var zeroBs: [UIButton]!
    
    @IBOutlet weak var nextBtn: UIButton!{
        didSet{
            nextBtn.layer.cornerRadius = nextBtn.bounds.height/2-4
        }
    }
    
    @IBOutlet weak var bottomCons100: NSLayoutConstraint!
    
    @IBOutlet weak var resultLb: UILabel!

    
    var step : Int = 0
    @IBOutlet var firstImg: [UIImageView]!
    @IBOutlet var secondImg: [UIImageView]!
    @IBOutlet weak var nextCon50: NSLayoutConstraint!
  
    @IBOutlet weak var restartBt: UIButton!{
        didSet{
            restartBt.layer.cornerRadius = restartBt.bounds.height/2-4
        }

    }

    
    @IBOutlet weak var homeBt: UIButton!{
        didSet{
            homeBt.layer.cornerRadius = homeBt.bounds.height/2-4
        }
    }
    
    
    
    
    @IBOutlet weak var resultView1: UIView!

    
    
    var questions : [Question] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        flexibleScreen()
        restart()
    }
    
    
    func restart(){
        step = 0
        resultView1.isHidden = true
        self.questions.removeAll()
        
        for _ in 1...10 {
            questions.append(Question())
        }
        let firstQuestion = questions.first!
        for (i,btn) in zeroBs.enumerated(){
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
            nextCon50.constant = 40
            for i in zeroBs{
                i.titleLabel?.font = UIFont.systemFont(ofSize: 40, weight: .bold)
            }
            plusLbl.font = UIFont.systemFont(ofSize: 40, weight: .bold)
            questionLbl.font = UIFont.systemFont(ofSize: 40, weight: .bold)
            bottomCons100.constant = 70
            
        
        }
    }
    @IBAction func nextTapped(_ sender: Any) {
        if step<9 {
            let nextQuestion = questions[step+1]
            for (i,btn) in zeroBs.enumerated(){
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
            self.resultLb.text = "\(correctAnswers)/\(questions.count)"
            resultView1.isHidden = false
        }
    }
    @IBAction func btnsChoosen(_ sender: UIButton){
        let currentQuestion1 = questions[step]
        
        if sender.currentTitle! != "\(currentQuestion1.choosenAnswer)"{
            sender.setTitleColor(.red, for: .normal)
        }
        
        
        for b in zeroBs{
            b.isEnabled = false
            
            if b.currentTitle! == "\(currentQuestion1.rightAnswer)"{
                b.setTitleColor(.green, for: .normal)
            }
        }
        questions[step].choosenAnswer = Int(sender.currentTitle!)

    }
    @IBAction func restartPressed(_ sender: Any) {
    }
    @IBAction func restartTapped(_ sender: Any) {
        restart()

    }
    
    @IBAction func homeTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil )

    }
        
    
}
