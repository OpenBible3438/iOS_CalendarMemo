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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentsView.text = "텍스트 입력"
        
        setCalendarUI()
    }
    
    @IBAction func tapTextView(_ sender: Any) {
        // 메모 작성 화면 이동
        let editVC = UIStoryboard(name: "EditViewController", bundle: nil).instantiateViewController(identifier: "EditViewController") as! EditViewController
        editVC.modalTransitionStyle = .coverVertical
        editVC.modalPresentationStyle = .fullScreen
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

}

