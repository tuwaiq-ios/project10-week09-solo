//
import Foundation

class QuestionBank{
    var list = [Question]()
    
    init() {
        list.append(Question(image: "1test", questionText: "ALGORITHMالخوارزمية ", choiceA: "A. الحلقة", choiceB: "B. المصفوفة", choiceC: "C.الاخطاء", choiceD: "D.عملية او مجموعة قواعد يجب اتباعها", answer: 4))
        
        list.append(Question(image: "2test", questionText: "القيمة المنطقية BOOLEAN ", choiceA: "A. Dominica", choiceB: "B. Bahamas", choiceC: "C. القيمة تكون صحيحة او خاطئة", choiceD: "British Virgin Islands", answer: 3))
        
        list.append(Question(image: "3test", questionText: "BorderRadius", choiceA: "A. Cuba", choiceB: "B. Aruba", choiceC: "C. Gaudeloupe", choiceD: "D. Cayman Islands", answer: 2))
        
        list.append(Question(image: "4test", questionText: "This country has a magnificent underwater cave system.", choiceA: "A. The Bahamas", choiceB: "B. Venezuela", choiceC: "C. Matinique", choiceD: "D. Dominican Republic", answer: 1))
        
        list.append(Question(image: "5test" , questionText: "This is the island of Cou-Cou and Flying Fish. The popular R&B singer Rihanna is from here.", choiceA: "A. Trinidad and Tobago" , choiceB: "B. Saint Kitts and Nevis" , choiceC: "C. Grenada" , choiceD: "D. Barbados", answer: 4))
        
        list.append(Question(image: "6test" , questionText: "Rum is the national drink of this country. The fastest man in the world Usain Bolt is from here.", choiceA: "A. Jamaica" , choiceB: "B. Saint Vincent and the Grenadines" , choiceC: "C. St. Lucia" , choiceD: "D. Guyana", answer: 1))
    }
}
