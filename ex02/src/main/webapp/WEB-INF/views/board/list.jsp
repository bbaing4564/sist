<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Tables</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				Board List Page
				<button id="regBtn" type="button" class="btn btn-xs pull-right">Register New Board</button>
			</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>#번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>수정일</th>
						</tr>
					</thead>
					<c:forEach items="${list}" var="board">
						<tr>
							<td>
								<c:out value="${board.bno}" />
							</td>
							<td>
								<!-- 게시물 조회 페이지 이동 -->
								<a href="/board/get?bno=<c:out value="${board.bno }"/>"> 
								<c:out value="${board.title}" />
								</a>
							</td>
							<td>
								<c:out value="${board.writer}" />
							</td>
							<td>
								<fmt:formatDate pattern="yyyy-MM-dd" value="${board.regDate}" />
							</td>
							<td>
								<fmt:formatDate pattern="yyyy-MM-dd" value="${board.updateDate}" />
							</td>
						</tr>
					</c:forEach>
				</table>

				<!-- start Pagination -->
				<div class='pull-right'>
					<ul class="pagination">
						<!-- prev 버튼 표시 -->
						<c:if test="${pageMaker.prev}">
							<li class="paginate_button previous"><a href="${pageMaker.statPage -1 }">Privious</a></li>
						</c:if>
						<!-- 페이지 번호 표시 -->
						<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage }">
							<li class='paginate_button ${pageMaker.cri.pageNum == num ? "active" : "" }'>
							<a href="${num }">${num }</a></li>
						</c:forEach>
						<!-- next 버튼 표시 -->
						<c:if test="${pageMaker.next}">
							<li class="paginate_button next"><a href="${pageMaker.endPage + 1}">Next</a></li>
						</c:if>
					</ul>
				</div>
				<!-- end Pagination -->
				
				<form id='actionForm' action="/board/list" method='get'>
					<input type="hidden" name='pageNum' value='${pageMaker.cri.pageNum}' />
					<input type="hidden" name='amount' value='${pageMaker.cri.amount}' />
				</form>
				<!-- Modal -->
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
								<h4 class="modal-title" id="myModalLabel">Modal title</h4>
							</div>
							<div class="modal-body">처리가 완료되었습니다.</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
								<button type="button" class="btn btn-primary">Save changes</button>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>
				<!-- /.modal -->
			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-6 -->
</div>
<!-- /.row -->
<script>
	$(function() {
		//result 속성의 bno값
		var result = '<c:out value="${result}"/>';
		checkModal(result);

		//뒤로 가기시에 modal 재출력 X 처리
		history.replaceState({}, null, null);

		function checkModal(result) {
			if (result === '' || history.state) {
				return;
			}
			if (parseInt(result) > 0) {
				$('.modal-body').html(parseInt(result) + "번 글이 등록되었습니다.")
			}
			//modal창 보여주기
			$("#myModal").modal("show");
		}

		//Register new board 버튼을 클릭하면 게시물 등록 화면 표시
		$("#regBtn").on("click", function() {
			self.location = "/board/register";
		});
		
		var actionForm = $("#actionForm");
		$(".paginate_button a").on("click", function(e){
			e.preventDefault();	//a tag 기본동작 막기
			
			//pageNum의 값을 클릭된 a의 href 값으로 변경
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			//폼 전송
			actionForm.submit();
		});
	});
</script>

<%@include file="../includes/footer.jsp"%>