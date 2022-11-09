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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setCalendar()
    }

    // Init FSCalendar
    func setCalendar() {
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
        
    }

}

