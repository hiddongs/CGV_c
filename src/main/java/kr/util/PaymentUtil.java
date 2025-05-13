package kr.util;

import java.time.LocalTime;
import java.util.Calendar;

import kr.Auditorium.vo.AuditoriumVO;
import kr.member.vo.MemberVO;
import kr.price.vo.PriceVO;
import kr.schedule.vo.ScheduleVO;

public class PaymentUtil {
    // 관람 인원을 반영하는 결제 금액 계산 메서드
    public static int calculateTotalPrice(MemberVO member, ScheduleVO schedule, AuditoriumVO auditorium, PriceVO price, int viewers) {
        int total = price.getPrice();

        // 주말 요금
        Calendar cal = Calendar.getInstance();
        cal.setTime(schedule.getScreeningDate());
        int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
        if (dayOfWeek == Calendar.SATURDAY || dayOfWeek == Calendar.SUNDAY) {
            total += price.getWeekend();
        }

        // 키즈 요금
        if (member.getGrade() != null && member.getGrade().equalsIgnoreCase("KIDS")) {
            total += price.getKids();
        }

        // 시간대 요금
        LocalTime startTime = schedule.getStartTime().toLocalDateTime().toLocalTime();
        if (startTime.isAfter(LocalTime.of(12, 0)) && startTime.isBefore(LocalTime.of(18, 0))) {
            total += price.getAfternoon();
        } else if (startTime.isAfter(LocalTime.of(22, 0)) || startTime.isBefore(LocalTime.of(6, 0))) {
            total += price.getMidnight();
        }

        // 상영관 타입별 추가 요금
        String type = auditorium.getType();
        if (type != null) {
            switch (type.toUpperCase()) {
                case "IMAX": total += price.getImax(); break;
                case "SCREENX": total += price.getScreenX(); break;
                case "4DX": total += price.getP_4DX(); break;
                case "3D": total += price.getP_3D(); break;
            }
        }
        System.out.println("1인당 가격: " + total);
        System.out.println("관람 인원: " + viewers);
        System.out.println("총 가격: " + (total * viewers));
        // 관람 인원 수 반영
        return total * viewers;
    }
}
