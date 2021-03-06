<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="imaw" uri="http://www.imaw.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>所有立项</title>
		<jsp:include page="../Model.jsp"></jsp:include>
	</head>
	<body>
		<jsp:include page="masterPage.jsp"></jsp:include>
		<!-- Main Page -->
		<div class="main ">
			<!-- Page Header -->
			<div class="page-header">
				<div class="pull-left">
					<ol class="breadcrumb visible-sm visible-md visible-lg">
						<li class="active"><a href="#"><i class="fa fa-folder"></i>立项管理</a></li>
						<li class="active"><a href="allProjects.jsp"><i
								class="fa fa-list-alt"></i>所有立项</a></li>
					</ol>
				</div>
				<div class="pull-right">
					<h2>所有立项</h2>
				</div>
			</div>
			<!-- End Page Header -->
	
			<div class="panel bk-bg-white bk-margin-bottom-20" id="div1">
				<div class="panel-heading bk-bg-primary">
					<h6>
						<i class="fa fa-list-alt"></i>所有立项
					</h6>
					<div class="panel-actions">
						<a class="btn-minimize"><i class="fa fa-chevron-up"></i></a>
					</div>
				</div>
	
				<div class="panel-body">
					<div class="bk-bg-white">
						<form>
							<div class="col-md-3 form-group col-md-offset-3">
								<input type="text" class="form-control" placeholder="请输入合同编号" />
							</div>
							<div>
								<div class="col-md-3">
									<button type="button" class="btn btn-primary">
										<i class="fa fa-search"></i> 查找
									</button>
								</div>
								<div class="pull-right">
									<a href="<c:url value='/benificiary/beforeSetUp.action'/>"><button
											type="button" class="btn btn-success" o>
											<i class="fa fa-plus-circle"></i> 创建立项
										</button></a>
								</div>
							</div>
						</form>
					</div>
	
					<div class="table-responsive">
						<table
							class="table table-striped table-bordered bootstrap-datatable datatable">
							<thead>
								<tr>
									<th>时间</th>
									<th>合同编号</th>
									<th>标题</th>
									<th>状态</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${projectList }" var="p" varStatus="status">
									<tr>
										<td><fmt:formatDate value="${p.setupTime }"
												pattern="yyyy-MM-dd" /></td>
										<td>${p.projectNum }</td>
										<td><c:choose>
												<c:when test="${p.isPassed eq 2}">
													<a
														href="${pageContext.request.contextPath}/benificiary/checkProject.action?projectId=${p.projectId}">${p.projectName }</a>
												</c:when>
												<c:when test="${p.isPassed eq 0 }">
													<a
														href="${pageContext.request.contextPath}/benificiary/toEditProject.action?projectId=${p.projectId}">${p.projectName }</a>
												</c:when>
												<c:otherwise>
													<a
														href="${pageContext.request.contextPath}/benificiary/checkProjectForm.action?projectId=${p.projectId}">${p.projectName }</a>
												</c:otherwise>
											</c:choose>
										<td><c:choose>
												<c:when test="${p.isPassed eq 0 }">
													<span class="label label-primary">未提交</span>
												</c:when>
												<c:when test="${p.isPassed eq 1 }">
													<span class="label label-warning">等待审核</span>
												</c:when>
												<c:when test="${p.isPassed eq 2 }">
													<span class="label label-success">审核通过</span>
												</c:when>
												<c:when test="${p.isPassed eq 3 }">
													<span class="label label-danger">审核无效</span>
												</c:when>
												<c:otherwise>
													<span>其他</span>
												</c:otherwise>
											</c:choose></td>
										<td>
											<c:choose>
												<c:when test="${p.isPassed eq 2 }">
													<a href="${pageContext.request.contextPath}/benificiary/checkProject.action?projectId=${p.projectId}">
														<button class="btn btn-info fa fa-eye " title="查看"></button>
													</a>
												</c:when>
												<c:when test="${p.isPassed eq 0 }">
													<a href="${pageContext.request.contextPath}/benificiary/toEditProject.action?projectId=${p.projectId}">
														<button class="btn btn-info fa fa-eye " title="查看"></button>
													</a>
												</c:when>
												<c:otherwise>
													<a href="${pageContext.request.contextPath}/benificiary/checkProjectForm.action?projectId=${p.projectId}">
														<button class="btn btn-info fa fa-eye " title="查看"></button>
													</a>
												</c:otherwise>
											</c:choose> 
												<a href="<c:url value='/download/downloadFile.action?filesId=${p.appformId }'/>" target="_blank">
												<button class="btn btn-primary fa fa-download " title="下载"></button>
										</a> <c:choose>
												<c:when test="${p.isPassed != 2 }">
													<button class="btn btn-success fa fa-upload " title="上传"
														disabled="disabled"></button>
												</c:when>
												<c:otherwise>
													<a href="<c:url value='/upload/toUpload.action?projectId=${p.projectId }'/>">
														<button class="btn btn-success fa fa-upload " title="上传"></button>
													</a>
												</c:otherwise>
											</c:choose>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
	
					<div class="row myPage">
						<imaw:page url="${pageContext.request.contextPath }/benificiary/getProjects.action" />
					</div>
				</div>
			</div>
		</div>
	</body>
</html>