//
//  ViewController.swift
//  CalendarMemo
//
//  Created by 편성경 on 2022/11/08.
//

import UIKit
import FSCalendar

class ViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance {
    
    @IBOutlet weak var calendarView: FSCalendar!
    @IBOutlet weak var contentsView: UITextView!
    
    var selectedDate: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectedDate = changeDateFormat(date: Date())
        contentsView.text = selectedDate
        
        setCalendarUI()
    }
    
    // 달력 날짜 선택 이벤트
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        selectedDate = changeDateFormat(date: date)
        contentsView.text = changeDateFormat(date: date)
    }
    
    @IBAction func tapTextView(_ sender: Any) {
        // 메모 작성 화면 이동
        let editVC = UIStoryboard(name: "EditViewController", bundle: nil).instantiateViewController(identifier: "EditViewController") as! EditViewController
        editVC.modalTransitionStyle = .coverVertical
        editVC.modalPresentationStyle = .fullScreen
        editVC.selectedDate = selectedDate
        editVC.selectedContents = contentsView.text
        self.present(editVC, animated: true, completion: nil)
    }
    
    // Init FSCalendar
    func setCalendarUI() {
        self.calendarView.delegate = self
        self.calendarView.dataSource = self
        
        // 달력 형태 : 월간
        self.calendarView.scope = .month
        
        // 요일 출력 언어
        self.calendarView.locale = Locale(identifier: "ko_KR")
        
        // 요일 글자 색
        self.calendarView.appearance.weekdayTextColor = UIColor.gray
        
        // 요일 날짜 색
        self.calendarView.appearance.todayColor = UIColor.blue
        
        // 선택된 날짜 색
        self.calendarView.appearance.selectionColor = UIColor.gray
        
        // 헤더 양 옆의 글씨 투명도 (안 보이게)
        self.calendarView.appearance.headerMinimumDissolvedAlpha = 0.0
        
        // 헤더 폰트 색상
        self.calendarView.appearance.headerTitleColor = UIColor.gray
        
        // 헤더 날짜 포맷
        self.calendarView.appearance.headerDateFormat = "YYYY년 MM월"
        
        // 날짜 선택될 때의 원 모서리
        //self.calendarView.appearance.borderRadius = 0.0
        
    }
    
    // Date -> yyyy.mm.dd.
    func changeDateFormat(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd."
        return dateFormatter.string(from: date)
    }

}

