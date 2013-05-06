$(function(){
	
});
	//页面分页算法

	/** 每页的行数 */
	var PAGE_ROW_COUNT = 20;

	/** 分页参数的前缀 */
	var PAGINATION_PREFIX = "Pagination_";
	
	/** 总行数 */
	var TOTAL_ROW_COUNT = PAGINATION_PREFIX + "TOTAL_ROW_COUNT";

	/** 页面起始行key */
	var PAGE_BEGIN_WITH = "pageBeginWith";

	/** 隐藏的当前页起始行key */
	var CURRENT_PAGE_BEGIN_WITH = PAGINATION_PREFIX + "pageBeginWith";

	/** 隐藏的总页数key */
	var TOTAL_PAGE = PAGINATION_PREFIX + "TOTAL_PAGE";
	
	//输出分页标签
	function printPaginationBar(){
		var totalRowCount = 0;
		var totalPage = 0;
		var currentPage = 0;
		var currentBeginWith = 0;
		var nextBeginWith = 0;
		var previousBeginWith = 0;
		var hasNext = false;
		var hasPrevious = false;
		totalRowCount = getTotalRowCount();
		if (totalRowCount > 0) {
			totalPage = getTotalPage(totalRowCount);
					//alert("tp:"+ totalPage);
			currentBeginWith = getBeginRowIndex();
					//alert("curtbeginWith:" + currentBeginWith);
			currentPage = currentBeginWith / PAGE_ROW_COUNT + 1;
					//alert("cpage:" + currentPage);
			if (currentPage != 1) {
				hasPrevious = true;
				previousBeginWith = currentBeginWith - PAGE_ROW_COUNT;
			}
			if (currentPage < totalPage) {
				hasNext = true;
				nextBeginWith = parseInt(currentBeginWith + PAGE_ROW_COUNT);
			}
			//alert("previousBeginWith: "+ previousBeginWith);
			//alert("nextBeginWith: "+ nextBeginWith);
		}
		
		var firstLink = getPageLink(0,hasPrevious,"首页");
		var preLink = getPageLink(previousBeginWith,hasPrevious,"上一页");
		var nextLink = getPageLink(nextBeginWith,hasNext,"下一页");
		var lastLink = getPageLink(((totalPage-1)*PAGE_ROW_COUNT),hasNext,"末页");
		$("#totalCountDiv").html(totalRowCount);
		$("#beginPageDiv").html(currentPage);
		$("#totalPageDiv").html(totalPage);
		$("#firstLinkDiv").html(firstLink);
		$("#preLinkDiv").html(preLink);
		$("#nextLinkDiv").html(nextLink);
		$("#lastLinkDiv").html(lastLink);
	}
	
	//获取查询结果的总行数。
	function getTotalRowCount() {
		var totalRowCount = 0;
		totalRowCount = $("#"+TOTAL_ROW_COUNT).val();
		totalRowCount = parseInt(totalRowCount);
		return totalRowCount;
	}
	
	function setTotalRowCount(totalRowCount) {
		$("#"+TOTAL_ROW_COUNT).val(totalRowCount);
	}
	
	function getTotalPage(totalRowCount) {
		var totalPage =0 ;
		totalPage = totalRowCount / PAGE_ROW_COUNT;
		if (totalRowCount % PAGE_ROW_COUNT != 0) {
			totalPage++;
		}
		totalPage = parseInt(totalPage);
		return totalPage;
	}
	
	function setBeginRowIndex(beginWith) {
		$("#"+CURRENT_PAGE_BEGIN_WITH).val(beginWith);
	}
	
	function getBeginRowIndex() {
		var beginWith = 0;
		var totalRowCount = 0;
		beginWith = $("#"+CURRENT_PAGE_BEGIN_WITH).val();
		beginWith = parseInt(beginWith);
		totalRowCount = getTotalRowCount();
		if ((beginWith > 0) && (totalRowCount > 0) && (beginWith >= totalRowCount)) {
			var totalPage = getTotalPage(totalRowCount);
			if (totalPage == 1) {
				beginWith = 0;
			}  
			if (totalPage > 1) {
				beginWith = (totalPage - 1) * PAGE_ROW_COUNT;
			}
		}
		beginWith = parseInt(beginWith);
		return beginWith;
	}
	
	//跳转类型start起始行数
	function getPageLink(start, has, pageName) {
		var linkStr="";
		if (has) {
			linkStr = "<a class=a href=\"#\" onClick=\"goTo(" + start + ");\" >" + pageName + "</a>";
		} else {
			linkStr = pageName;
		}
		return linkStr;
	}
	
	//跳转到指定行数位置
	function goTo(start){
		//查询列表，并渲染
		var keyword = $("#keyword").val();
		var qType = 0;
		var	enpData = findEnterprise(keyword,qType,start,PAGE_ROW_COUNT);
		var totCount = enpData.response.numFound;
		fillEnterprise(qType,enpData.response.docs,"enpListTable");
		lazyClear("msg1");//延迟清空提示信息
		//初始化分页
		setTotalRowCount(totCount);
		setBeginRowIndex(start);
		printPaginationBar();
	}
	
	function Pagination_goTo(){
		var goToNum = $("#Pagination_PAGE_GO_TO").val(); 
		var totalRowCount = getTotalRowCount();
		var totalPage = getTotalPage(totalRowCount);
		var pageRowCount = $("#Pagination_PAGE_ROW_COUNT").val();
		if (typeof(goToNum)=="undefinded" || goToNum=="") {
			alert('请输入正整数页码！');
		} else if (isNaN(goToNum)) {
			alert('请输入正整数页码！');
			$("#Pagination_PAGE_GO_TO").val("");
		} else if (parseInt(goToNum, 10) <=0) {
			alert('请输入正整数页码！');
			$("#Pagination_PAGE_GO_TO").val("");
		} else if (parseInt(goToNum, 10) > parseInt(totalPage, 10)) {
			alert('你定位的页数不能大于当前结果的最大页数！');
			$("#Pagination_PAGE_GO_TO").val("");
		} else {
			var start = (goToNum-1)*PAGE_ROW_COUNT;
			start = parseInt(start);
			goTo(start);
		}
		return false;
	}

	
