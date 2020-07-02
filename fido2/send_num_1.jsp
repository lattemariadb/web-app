<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
  <head>
    <title>Fingerprintjs2 test</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="./css/login.css">
    <link rel="stylesheet" href="./css/send_num.css">
  
   <!-- qr 코드에 필요한 js 파일 (빼면 안됨) --> 
    <script type="text/javascript" src="./js/jquery.min.js"></script>
    <script type="text/javascript" src="./js/qrcode.js"></script>
  

     <!-- text에 난수 값 넣어주면됨 --> 
     <!-- 참고: https://davidshimjs.github.io/qrcodejs/ --> 
  
<script language="JavaScript">
	
		var SetTime = 60;		// 최초 설정 시간(기본 : 초)

		function msg_time() {	// 1초씩 카운트
			
			m = Math.floor(SetTime / 60) + "분 " + (SetTime % 60) + "초";	// 남은 시간 계산
			
			var msg = "현재 남은 시간은 <font color='red'>" + m + "</font> 입니다.";
			
			document.all.ViewTimer.innerHTML = msg;		// div 영역에 보여줌 
					
			SetTime--;					// 1초씩 감소
			
			if (SetTime < 0) {			// 시간이 종료 되었으면..
				
				clearInterval(tid);		// 타이머 해제
				location.reload();
			}
			
		}

		window.onload = function TimerStart(){ tid=setInterval('msg_time()',1000) };
		
	</script>


  </head>
  <body>
    <div class="wrapper">
      <div class="container">
          <h2 class="logo">QRCode를 어플에서 스캔해주세요.</h2>
          <a href="#" onClick="window.location.reload()"><h5 class="logo"> QRcode 재요청</h5></a>   
          <%@ page import="java.util.*"%>
          <%
            Random rand = new Random();
            char [] dic = new char[62];
            int idx = 0;
            String text = "";

            for(char c='0';c<='9';c++){
              dic[idx] = c;
              idx += 1;
            }
            for(char c='a';c<='z';c++){
              dic[idx] = c;
              idx += 1;
            }
            for(char c='A';c<='Z';c++){
              dic[idx] = c;
              idx += 1;
            }

            for(int i=0;i<30;i++){
              text = text + Character.toString(dic[rand.nextInt(62)]);
            }
          
      
          %>
   
          
          <div id="qrcode" style="width:100px; height:100px; margin-top:15px;"></div>
          <div id="ViewTimer"></div>  <!-- qr 코드 띄어주는 div -->
      </div>  
    </div>

    <script type="text/javascript">
        var qrcode = new QRCode(document.getElementById("qrcode"), {
            width: 100,
            height: 100
        });

        function makeCode(txt) {
            qrcode.makeCode(txt);
        }

        makeCode("<%=text%>")
    </script>
    
  </body>
</html>