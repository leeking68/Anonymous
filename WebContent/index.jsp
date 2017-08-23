<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-widthm, intial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>JSP AJAX 실시간 익명 채팅 사이</title>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootsrap.js"></script>
</head>
<body>
	<div class="container">
		<div class="container bootstrap snippet">
			<div class="row">
				<div class="col-xs-12">
					<div class="portlet portlet-default">
						<div class="portlet-heading">
							<div class="portlet-title">
								<h4><i class="fa fa-circle text-green"></i>실시간채팅방</h4>
							</div>
								<div class="clearfix"></div>
						</div>
						<div id="char" class="panel-collapse collapse in">
							<div class="portlet-body char-widget" style="overflow-y: auto; width: auto; height: 300px;"></div>
								<div class="row">
									<div class="col-lg-12">
										<p class="text-center text-muted small">2017년 8월 21</p>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-12">
										<div class="media">
											<a class="pull-left" href="#">
												<img class="media-object img-circle" src="images/go.png">
											</a>
											<div class="media-body">
												<h4 class="media-heading">홍길동
													<span class="small pull-right">오전 12:33</span>
												</h4>
											</div>
											<p>안녕하세요. 오랜만입니다. 홍길동이에요</p>
										</div>	
									</div>
								</div>
							<hr>
							<div class="row">
								<div class="col-lg-12">
									<div class="media">
										<a class="pull-left" href="#">
											<img class="media-object img-circle" src="images/go.png">
										</a>
										<div class="media-body">
											<h4 class="media-heading">이이
												<span class="small pull-right">오전 12:40</span>												</h4>
										</div>
										<p>나도 방가워</p>
									</div>	
								</div>
							</div>
						</div>
						<div class="portlet-footer">
							<div class="row">
								<div class="form-group col-xs-4">
									<input style="height: 40px;" type="text" id="chatName" class="form-control" placeholder="이름" maxlength="20">
								</div>
							</div>
							<div class="row" style="height: 90px">
								<div class="form-group col-xs-10">
									<textarea style="height: 80px;" id="chatContent" class="form-control" placeholder="메시지를입력하시오" maxlength="100">
									</textarea>
								</div>
								<div class="form-group col-xs-2">
									<button type=button" class="btn btn-default pull-right" onclick="submitFunction();"></button>
									<div class="clearfix"></div>
								</div>
							</div>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>