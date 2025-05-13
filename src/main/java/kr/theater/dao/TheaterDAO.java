package kr.theater.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import kr.schedule.vo.ScheduleVO;
import kr.theater.vo.TheaterVO;
import kr.util.DBUtil;

public class TheaterDAO {


	private static TheaterDAO instance = new TheaterDAO();
	
	public static TheaterDAO getInstance() {
		return instance;
	}
	
	/**
	 * 극장 등록 메서드
	 * @param theater 등록할 극장 정보
	 * @return 등록 성공 여부
	 */
	public boolean insertTheater(TheaterVO theater) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			conn = DBUtil.getConnection();
			sql = "INSERT INTO theater (theater_id, name, region, description) VALUES (theater_seq.nextval ,?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, theater.getName());
			pstmt.setString(2, theater.getRegion());
			pstmt.setString(3, theater.getDescription());
			
			return pstmt.executeUpdate() > 0;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
	
	/**
	 * 극장 정보 업데이트 메서드
	 * @param theater 업데이트할 극장 정보
	 * @return 업데이트 성공 여부
	 */
	public boolean updateTheater(TheaterVO theater) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			conn = DBUtil.getConnection();
			sql = "UPDATE theater SET name=?, region=?, description=? WHERE theater_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, theater.getName());
			pstmt.setString(2, theater.getRegion());
			pstmt.setString(3, theater.getDescription());
			pstmt.setInt(4, theater.getTheaterId());
			
			return pstmt.executeUpdate() > 0;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
	
	/**
	 * 극장 삭제 메서드
	 * @param theaterId 삭제할 극장 ID
	 * @return 삭제 성공 여부
	 */
	public boolean deleteTheater(int theaterId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			conn = DBUtil.getConnection();
			sql = "DELETE FROM theater WHERE theater_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, theaterId);
			
			return pstmt.executeUpdate() > 0;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
	
	// 극장 지역 반환 
	public List<TheaterVO> getTheaterList(){
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		List<TheaterVO> list = new ArrayList<>();
		
		try {
			conn = DBUtil.getConnection();
			sql = "SELECT * FROM theater";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				do {
					TheaterVO theater = new TheaterVO();
					theater.setTheaterId(rs.getInt("THEATER_ID"));
					theater.setRegion(rs.getString("REGION"));
					theater.setName(rs.getString("NAME"));
					theater.setDescription(rs.getString("DESCRIPTION"));
			
					list.add(theater);
				}while(rs.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		
		
		return list;
	}
	public List<TheaterVO> getAllRegionList(){
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    String sql = null;
	    ResultSet rs = null;
	    List<TheaterVO> allRegionList = new ArrayList<>();
	    
	    try {
	        conn = DBUtil.getConnection();
	        sql = "SELECT DISTINCT region FROM theater";
	        pstmt = conn.prepareStatement(sql);
	        rs = pstmt.executeQuery();
	        
	        while (rs.next()) { // rs.next() 안에서 do~while 말고 그냥 while
	            TheaterVO theaterVO = new TheaterVO();
	            theaterVO.setRegion(rs.getString("region"));
	            allRegionList.add(theaterVO);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        DBUtil.executeClose(rs, pstmt, conn);
	    }
	    return allRegionList;
	}

 

    

    // 모든 지역 목록 조회 (중복 제거)
    public List<String> getAllStringRegionList() {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<String> allRegionList = new ArrayList<>();

        try {
            conn = DBUtil.getConnection();
            String sql = "SELECT DISTINCT region FROM theater";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                allRegionList.add(rs.getString("region"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtil.executeClose(rs, pstmt, conn);
        }

        return allRegionList;
    }

    // 특정 극장 ID로 해당 지역 정보 조회
    public String getRegionByTheaterId(int theaterId) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String region = null;

        try {
            conn = DBUtil.getConnection();
            String sql = "SELECT region FROM theater WHERE theater_id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, theaterId);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                region = rs.getString("region");
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtil.executeClose(rs, pstmt, conn);
        }

        return region;
    }

    // 지역명을 기준으로 해당 지역의 극장 리스트 반환
    public List<TheaterVO> selectTheaterList(String region) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<TheaterVO> theaterList = new ArrayList<>();

        try {
            conn = DBUtil.getConnection();
            String sql = "SELECT theater_id, name FROM theater WHERE region = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, region);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                TheaterVO theater = new TheaterVO();
                theater.setTheaterId(rs.getInt("theater_id"));
                theater.setName(rs.getString("name"));
                theaterList.add(theater);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtil.executeClose(rs, pstmt, conn);
        }

        return theaterList;
    }


    // theater_id 기준 단일 극장 정보 조회
    public TheaterVO getTheater(int theaterID) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        TheaterVO theater = null;

        try {
            conn = DBUtil.getConnection();
            String sql = "SELECT * FROM theater WHERE theater_id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, theaterID);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                theater = new TheaterVO();
                theater.setTheaterId(rs.getInt("theater_id"));
                theater.setName(rs.getString("name"));
                theater.setRegion(rs.getString("region"));
                theater.setDescription(rs.getString("description"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtil.executeClose(rs, pstmt, conn);
        }

        return theater;
    }
  

    public List<TheaterVO> getTheatersByMovie(int movieID) {
        List<TheaterVO> list = new ArrayList<>();
        String sql = "SELECT DISTINCT t.* FROM theater t " +
                     "JOIN schedule s ON t.theater_id = s.theater_id " +
                     "WHERE s.movie_id = ? AND s.is_available = 1";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, movieID);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                TheaterVO vo = new TheaterVO();
                vo.setTheaterId(rs.getInt("theater_id"));
                vo.setName(rs.getString("name"));
                vo.setRegion(rs.getString("region"));
                list.add(vo);
            }
            
            System.out.println("영화 ID: " + movieID);
            System.out.println("조회된 극장 수: " + list.size());
            for (TheaterVO vo : list) {
                System.out.println("극장 ID: " + vo.getTheaterId() + ", 이름: " + vo.getName() + ", 지역: " + vo.getRegion());
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
  
   
 // 🔧 지역 + 영화ID로 가능한 극장 조회
    public List<TheaterVO> getTheatersByMovieAndRegion(int movieID, String region) {
        List<TheaterVO> list = new ArrayList<>();
        String sql = "SELECT DISTINCT t.* FROM theater t " +
                     "JOIN schedule s ON t.theater_id = s.theater_id " +
                     "WHERE s.movie_id = ? AND t.region = ? AND s.is_available = 1";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, movieID);
            pstmt.setString(2, region);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                TheaterVO vo = new TheaterVO();
                vo.setTheaterId(rs.getInt("theater_id"));
                vo.setName(rs.getString("name"));
                vo.setRegion(rs.getString("region"));
                list.add(vo);
            }
            System.out.println("[DEBUG] 전달된 지역값: [" + region + "]");


        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

	// 특정 지역만 보여주기
    public List<TheaterVO> getRegionList(int num) throws Exception{
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		List<TheaterVO> list = new ArrayList<>();
		
		try {
			conn = DBUtil.getConnection();
			sql = "SELECT region FROM theater WHERE theater_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, num);
			rs = pstmt.executeQuery();
			
			
			if(rs.next()) {
				do {
					TheaterVO theater = new TheaterVO();	
					theater.setRegion(rs.getString("REGION"));
					list.add(theater);
				}while(rs.next());
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		
		
		return list;
	}

	public TheaterVO getTheater(Long theater_id) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		TheaterVO result = new TheaterVO();
		
		try {
			conn = DBUtil.getConnection();
			sql = "SELECT * FROM theater where theater_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, theater_id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result.setTheaterId(rs.getInt("THEATER_ID"));
				result.setRegion(rs.getString("REGION"));
				result.setName(rs.getString("NAME"));
				result.setDescription(rs.getString("DESCRIPTION"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return result;
	}

}
