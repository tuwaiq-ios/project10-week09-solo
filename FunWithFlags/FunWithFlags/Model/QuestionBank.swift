//
//  SceneDelegate.swift
//  KidsLogic
//
//  Created by sara saud on 23/04/1443 AH.
//

import Foundation

class QuestionBank{
    var list = [Question]()
    
    init() {
        list.append(Question(image: "1test", questionText: "ALGORITHMالخوارزمية ", choiceA: "A. الحلقة", choiceB: "B. المصفوفة", choiceC: "C.الاخطاء", choiceD: "D.عملية او مجموعة قواعد يجب اتباعها", answer: 4))
        
        list.append(Question(image: "2test", questionText: "القيمة المنطقية BOOLEAN ", choiceA: "A. مربع", choiceB: "B. كود", choiceC: "C. القيمة تكون صحيحة او خاطئة", choiceD: "صيغة ", answer: 3))
        
        list.append(Question(image: "3test", questionText: "BorderRadius", choiceA: "A. الوان", choiceB: "B. الحدود", choiceC: "C.دائرة ", choiceD: "D.شكل ", answer: 2))
        
        list.append(Question(image: "4test", questionText: " BUG", choiceA: "A.خطأ برمجي", choiceB: "B. نملة", choiceC: "C. حشرة", choiceD: "D.خطأ منطقي", answer: 1))
        
        list.append(Question(image: "5test" , questionText: "CSS", choiceA: "A.دالة" , choiceB: "B. برمجية" , choiceC: "C. حلقة" , choiceD: "D. اختصار ل - (Cascading Style Sheet)", answer: 4))
        
        list.append(Question(image: "6test" , questionText: "DEBUG", choiceA: "A. تصحيح برمجي" , choiceB: "B. زوايا" , choiceC: "C. خطأ برمجي" , choiceD: "D. لعبة", answer: 1))
    }
}
