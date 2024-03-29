import UIKit


final class MovieQuizViewController: UIViewController {
    
    private var currentQuestionIndex = 0
    private var correctAnswers = 0
    private var isEnabled = true
    
  
    //Оутлеты
    @IBOutlet private weak var imageView: UIImageView!
    
    @IBOutlet private weak var counterLabel: UILabel!
    
    @IBOutlet private weak var textLabel: UILabel!
    
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewDisplay()
        let currentQuestion = questions[currentQuestionIndex]
        let viewModel = convert(model: currentQuestion)
        show(quiz: viewModel)
        
        let action = UIAlertAction(title: "Сыграть ещё раз", style: .default) { _ in
            self.currentQuestionIndex = 0 // 1
            
            let firstQuestion = self.questions[self.currentQuestionIndex] // 2
            let viewModel = self.convert(model: firstQuestion)
            self.show(quiz: viewModel)
        }

        
      
    }
    
    @IBAction private func noButtonClicked(_ sender: UIButton) {
        if self.isEnabled{
           
            self.isEnabled = false
            let currentQuestion = questions[currentQuestionIndex]
            let givenAnswer = false
            
            showAnswerResult(isCorrect: currentQuestion.correctAnswer == givenAnswer)
        }
    }
    
    @IBAction private func yesButtonClicked(_ sender: UIButton) {
        
        if self.isEnabled{
            
            self.isEnabled = false
            let currentQuestion = questions[currentQuestionIndex]
            let givenAnswer = true
            
            showAnswerResult(isCorrect: currentQuestion.correctAnswer == givenAnswer)
        }
    }
    
    struct QuizResultsViewModel{
        let title: String
        let text: String
        let buttonText: String
    }
    
    struct QuizStepViewModel {
        let image: UIImage
        let quesion: String
        let questionNumber: String
    }

    struct QuizQuestion {
        let image: String
        let text: String
        let correctAnswer: Bool
    }

    private let questions: [QuizQuestion] = [
    QuizQuestion(image: "The Godfather", text: "Рейтинг этого фильма больше чем 6?", correctAnswer: true),
    QuizQuestion(image: "The Dark Knight", text: "Рейтинг этого фильма больше чем 6?", correctAnswer: true),
    QuizQuestion(image: "Kill Bill", text: "Рейтинг этого фильма больше чем 6?", correctAnswer: true),
    QuizQuestion(image: "The Avengers", text: "Рейтинг этого фильма больше чем 6?", correctAnswer: true),
    QuizQuestion(image: "Deadpool", text: "Рейтинг этого фильма больше чем 6?", correctAnswer: true),
    QuizQuestion(image: "The Green Knight", text: "Рейтинг этого фильма больше чем 6?", correctAnswer: true),
    QuizQuestion(image: "The Ice Age Adventures of Buck Wild", text: "Рейтинг этого фильма больше чем 6?", correctAnswer: false),
    QuizQuestion(image: "Tesla", text: "Рейтинг этого фильма больше чем 6?", correctAnswer: false),
    QuizQuestion(image: "Vivarium", text: "Рейтинг этого фильма больше чем 6?", correctAnswer: false),
    QuizQuestion(image: "Old", text: "Рейтинг этого фильма больше чем 6?", correctAnswer: false)
    ]


   
    
    private func convert(model: QuizQuestion)->QuizStepViewModel{
        let questionStep = QuizStepViewModel(image: UIImage(named: model.image) ?? UIImage(), quesion: model.text, questionNumber: "\(currentQuestionIndex+1)/\(questions.count)")
            return questionStep
    }
    private func show(quiz result: QuizResultsViewModel) {
        let alert = UIAlertController(
            title: result.title,
            message: result.text,
            preferredStyle: .alert)
        
        let action = UIAlertAction(title: result.buttonText, style: .default) { _ in
            self.currentQuestionIndex = 0
            self.correctAnswers = 0
            
            let firstQuestion = self.questions[self.currentQuestionIndex]
            let viewModel = self.convert(model: firstQuestion)
            self.show(quiz: viewModel)
        }
        
        alert.addAction(action)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    private func show(quiz step: QuizStepViewModel){
        imageView.image = step.image
        counterLabel.text = step.questionNumber
        textLabel.text = step.quesion
    }
    
    private func showAnswerResult(isCorrect: Bool){
        
            if isCorrect{
                correctAnswers+=1
            }
            imageView.layer.masksToBounds = true
            imageView.layer.borderWidth = 8
            imageView.layer.borderColor = isCorrect ? UIColor.ypGreen.cgColor : UIColor.ypRed.cgColor
            imageView.layer.cornerRadius = 20
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                // код, который мы хотим вызвать через 1 секунду
                self.showNextQuestionOrResults()
                self.isEnabled = true
                self.imageView.layer.borderWidth = 0
                
            }
        
    }
    
    private func showNextQuestionOrResults() {
        if currentQuestionIndex == questions.count - 1 {
            let text = "Ваш результат: \(correctAnswers)/10" // 1
            let viewModel = QuizResultsViewModel( // 2
                title: "Этот раунд окончен!",
                text: text,
                buttonText: "Сыграть ещё раз")
            show(quiz: viewModel) // 3
        } else {
            currentQuestionIndex += 1
            let nextQuestion = questions[currentQuestionIndex]
            let viewModel = convert(model: nextQuestion)
            
            show(quiz: viewModel)
        }
    }
    
    private func viewDisplay(){
        imageView.layer.cornerRadius = 20
    }
}




/*
 Mock-данные
 
 
 Картинка: The Godfather
 Настоящий рейтинг: 9,2
 Вопрос: Рейтинг этого фильма больше чем 6?
 Ответ: ДА


 Картинка: The Dark Knight
 Настоящий рейтинг: 9
 Вопрос: Рейтинг этого фильма больше чем 6?
 Ответ: ДА


 Картинка: Kill Bill
 Настоящий рейтинг: 8,1
 Вопрос: Рейтинг этого фильма больше чем 6?
 Ответ: ДА


 Картинка: The Avengers
 Настоящий рейтинг: 8
 Вопрос: Рейтинг этого фильма больше чем 6?
 Ответ: ДА


 Картинка: Deadpool
 Настоящий рейтинг: 8
 Вопрос: Рейтинг этого фильма больше чем 6?
 Ответ: ДА


 Картинка: The Green Knight
 Настоящий рейтинг: 6,6
 Вопрос: Рейтинг этого фильма больше чем 6?
 Ответ: ДА


 Картинка: Old
 Настоящий рейтинг: 5,8
 Вопрос: Рейтинг этого фильма больше чем 6?
 Ответ: НЕТ


 Картинка: The Ice Age Adventures of Buck Wild
 Настоящий рейтинг: 4,3
 Вопрос: Рейтинг этого фильма больше чем 6?
 Ответ: НЕТ


 Картинка: Tesla
 Настоящий рейтинг: 5,1
 Вопрос: Рейтинг этого фильма больше чем 6?
 Ответ: НЕТ


 Картинка: Vivarium
 Настоящий рейтинг: 5,8
 Вопрос: Рейтинг этого фильма больше чем 6?
 Ответ: НЕТ
 */
