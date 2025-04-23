<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
   

        <!DOCTYPE html>
        <html>
 <%@ include file="/WEB-INF/views/common/header.jsp" %>
        <head>
            <meta charset="UTF-8">
            <title>특별관 소개 페이지</title>
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/specialMovie.css">
             <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">

        </head>

        <body>
        
            <h2 class="title">CGV만의 특별함이 있는 영화관을 소개합니다.</h2>
            <span class="subTitle">#TECHNOLOGY</span>
            <span class="text">TECHNOLOGY</span><span class="vertical-line"></span>

            <span class="subText">
                진화된 3S(Screen, Sound, Seat) 기술로 컨텐츠 몰입도를 극대화하여 영화 관람에 최적화된 환경을 제공합니다.
            </span>
            
            <br>
            
          
            <div class="img-container">
            <img src="${pageContext.request.contextPath}/images/imax.jpg" class="specialMovie" height="250">
            <span class="img-text">
             IMAX <br>궁극의 몰입관
            </span>
            </div>
            
            <div class="img-container">
            <img src="${pageContext.request.contextPath}/images/4dx.jpg" class="specialMovie" height="250" width="300">
            <span class="img-text">
             4DX <br>특별한 오감체험
            </span>
            </div>
            
            <div class="img-container">
            <img src="${pageContext.request.contextPath}/images/3d.jpg" class="specialMovie" height="250">
            <span class="img-text">
             3D <br>생생한 몰입
            </span>
            </div>
            
            <div class="img-container">
            <img src="${pageContext.request.contextPath}/images/screenx.jpg" class="specialMovie" height="250" width="393">
            <span class="img-text">
             SCREENX <br>세계 최초 다면 상영관
            </span>
            </div>
              
         
       
        </body>
  <%@ include file="/WEB-INF/views/common/footer.jsp" %>
        </html>
       