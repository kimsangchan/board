<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
			
		}
	%>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>	
			</button>
			<a class="navbar-brand" href="main.jsp">JSP 게시판 웹 사이트</a>
		</div>
		<div class="collpase navbar-collpase" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="main.jsp">메인</a></li>
				<li><a href="bbs.jsp">게시판</a></li>
				
			</ul>
			<%
				if(userID == null) {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul>
				</li>
			</ul>
			<%
				} else {
					
				
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">회원관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">로그아웃</a></li>
						
					</ul>
				</li>
			</ul>
			<%
				}			
			%>
		</div>
	</nav>
	<div class="container">
		<div class="jumbotron">
			<div class="container">
				<h1>웹 사이트 소개</h1>
				<p>이 웹 사이트는 부트스트랩으로 만든 JSP 웹 사이트입니다. 최소한의 간단한 로직만을 이용해서 개발했습니다. 디자인 템플릿으로는 부트스트랩을 사용했습니다.</p>
				<p><a class="btn btn-primary btn-pull" href="#" role="button">자세히 알아보기</a></p>
			</div>
		</div>
	</div>
	
	<div class="container">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>				
			</ol>
			<div class="carousel-inner">
				<div class="item active">
					<img src="images/clock.png">
				</div>
				<div class="item">
					<img src="images/Smarttoilet.jpg">
				</div>
				<div class="item">
					<img src="images/toilet.png">
				</div>
			</div>
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span>
			</a>
			<a class="right carousel-control" href="#myCarousel" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right"></span>
			</a>
				
		</div>
	</div>
	<div class="seatSelection col-lg-12">
                        <p class="seatSection">
                         Your first
                            <span class="freeSeats">2</span> seats selected will be Free.<br /> You can add more seats and proceed to check out.
                        </p>
                        <div class="seatsChart col-lg-6">
                            <div class="seatRow">
                                <div class="seatRowNumber">
                                    Row 1
                                </div>
                                <div id="1_1" title="" role="checkbox" value="45" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber seatUnavailable">1</div>
                                <div id="1_2" role="checkbox" value="45" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">2</div>
                                <div id="1_3" role="checkbox" value="45" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">3</div>
                                <div id="1_4" role="checkbox" value="45" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber seatUnavailable">4</div>
                                <div id="1_5" role="checkbox" value="45" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">5</div>
                                <div id="1_6" role="checkbox" value="45" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber  ">6</div>
                                <div id="1_7" role="checkbox" value="45" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">7</div>
                                <div id="1_8" role="checkbox" value="45" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">8</div>


                            </div>
                            <div class="seatRow">
                                <div class="seatRowNumber">
                                    Row 2
                                </div>
                                <div id="2_1" role="checkbox" value="42" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">1</div>
                                <div id="2_2" role="checkbox" value="42" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber seatUnavailable">2</div>
                                <div id="2_3" role="checkbox" value="42" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">3</div>
                                <div id="2_4" role="checkbox" value="42" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">4</div>
                                <div id="2_5" role="checkbox" value="42" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">5</div>
                                <div id="2_6" role="checkbox" value="42" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber  ">6</div>
                                <div id="2_7" role="checkbox" value="42" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">7</div>
                                <div id="2_8" role="checkbox" value="42" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber seatUnavailable">8</div>

                            </div>
                            <div class="seatRow">
                                <div class="seatRowNumber">
                                    Row 3
                                </div>
                                <div id="3_1" role="checkbox" value="38" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber seatUnavailable">1</div>
                                <div id="3_2" role="checkbox" value="38" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">2</div>
                                <div id="3_3" role="checkbox" value="38" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber seatUnavailable">3</div>
                                <div id="3_4" role="checkbox" value="38" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">4</div>
                                <div id="3_5" role="checkbox" value="38" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber seatUnavailable">5</div>
                                <div id="3_6" role="checkbox" value="38" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber  ">6</div>
                                <div id="3_7" role="checkbox" value="38" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">7</div>
                                <div id="3_8" role="checkbox" value="38" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">8</div>

                            </div>
                            <div class="seatRow">
                                <div class="seatRowNumber">
                                    Row 4
                                </div>
                                <div id="4_1" role="checkbox" value="30" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">1</div>
                                <div id="4_2" role="checkbox" value="30" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">2</div>
                                <div id="4_3" role="checkbox" value="30" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">3</div>
                                <div id="4_4" role="checkbox" value="30" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">4</div>
                                <div id="4_5" role="checkbox" value="30" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">5</div>
                                <div id="4_6" role="checkbox" value="30" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber seatUnavailable ">6</div>
                                <div id="4_7" role="checkbox" value="30" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">7</div>
                                <div id="4_8" role="checkbox" value="30" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">8</div>

                            </div>
                            <div class="seatRow">
                                <div class="seatRowNumber">
                                    Row 5
                                </div>
                                <div id="5_1" role="checkbox" value="28" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber seatUnavailable">1</div>
                                <div id="5_2" role="checkbox" value="28" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">2</div>
                                <div id="5_3" role="checkbox" value="28" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">3</div>
                                <div id="5_4" role="checkbox" value="28" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber seatUnavailable">4</div>
                                <div id="5_5" role="checkbox" value="28" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">5</div>
                                <div id="5_6" role="checkbox" value="28" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber seatUnavailable ">6</div>
                                <div id="5_7" role="checkbox" value="28" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">7</div>
                                <div id="5_8" role="checkbox" value="28" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">8</div>
                            </div>
                        </div>
                        <div class="seatsReceipt col-lg-2">
                            <p><strong>Selected Seats: <span class="seatsAmount" />0 </span></strong> <button id="btnClear" class="btn">Clear</button></p>
                            <ul id="seatsList" class="nav nav-stacked"></ul>

                        </div>
                    </div>

                    <div class="checkout col-lg-offset-6">
                        <span>Subtotal: CA$</span><span class="txtSubTotal">0.00</span><br /><button id="btnCheckout" name="btnCheckout" class="btn btn-primary"> Check out </button>
                       
                    </div>
                </div>

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
	<script>
	 // Clicking any seat
    $(".seatNumber").click(
        function () {
            if (!$(this).hasClass("seatUnavailable")){
                // If selected, unselect it
                if ($(this).hasClass("seatSelected")) {
                    var thisId = $(this).attr('id');
                    var price = $('#seatsList .' + thisId).val();
                    $(this).removeClass("seatSelected");
                    $('#seatsList .' + thisId).remove();
                    // Calling functions to update checkout total and seat counter.
                    removeFromCheckout(price);
                    refreshCounter();
                }
                else {
                    // else, select it
                    // getting values from Seat
                    var thisId = $(this).attr('id');
                    var id = thisId.split("_");
                    var price = $(this).attr('value');
                    var seatDetails = "Row: " + id[0] + " Seat:" + id[1] + " Price:CA$:" + price;
                    
                   
                    var freeSeats = parseInt($('.freeSeats').first().text());
                    var selectedSeats = parseInt($(".seatSelected").length);
                    
                    // If you have free seats available the price of this one will be 0.
                    if (selectedSeats < freeSeats) {
                        price = 0;
                    }

                    // Adding this seat to the list
                    var seatDetails = "Row: " + id[0] + " Seat:" + id[1] + " Price:CA$:" + price;
                    $("#seatsList").append('<li value=' + price + ' class=' + thisId + '>' + seatDetails + "  " + "<button id='remove:" + thisId + "'+ class='btn btn-default btn-sm removeSeat' value='" + price + "'><strong>X</strong></button></li>");
                    $(this).addClass("seatSelected");
                
                    addToCheckout(price);
                    refreshCounter();
                }
            }
        }
    );
    // Clicking any of the dynamically-generated X buttons on the list
    $(document).on('click', ".removeSeat", function () {
        // Getting the Id of the Seat
        var id = $(this).attr('id').split(":");
        var price = $(this).attr('value')
        $('#seatsList .' + id[1]).remove();
        $("#" + id[1] + ".seatNumber").removeClass("seatSelected");
        removeFromCheckout(price);
        refreshCounter();
      }
  );
    // Show tooltip on hover.
    $(".seatNumber").hover(
        function () {
            if (!$(this).hasClass("seatUnavailable")) {
                var id = $(this).attr('id');
                var id = id.split("_");
                var price = $(this).attr('value');
                var tooltip = "Row: " + id[0] + " Seat:" + id[1] + " Price:CA$:" + price;

                $(this).prop('title', tooltip);
            } else
            {
                $(this).prop('title', "Seat unavailable");
            }
        }
        );
    // Function to refresh seats counter
    function refreshCounter() {
        $(".seatsAmount").text($(".seatSelected").length); 
    }
    // Add seat to checkout
    function addToCheckout(thisSeat) {
        var seatPrice = parseInt(thisSeat);
        var num = parseInt($('.txtSubTotal').text());
        num += seatPrice;
        num = num.toString();
        $('.txtSubTotal').text(num);
    }
    // Remove seat from checkout
    function removeFromCheckout(thisSeat) {
        var seatPrice = parseInt(thisSeat);
        var num = parseInt($('.txtSubTotal').text());
        num -= seatPrice;
        num = num.toString();
        $('.txtSubTotal').text(num);
    }

    // Clear seats.
    $("#btnClear").click(
        function () {
            $('.txtSubTotal').text(0);
            $(".seatsAmount").text(0);
            $('.seatSelected').removeClass('seatSelected');
            $('#seatsList li').remove();
        }
    );
	</script>
</html> 