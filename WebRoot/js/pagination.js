$(function(){
	
});
	//ҳ���ҳ�㷨

	/** ÿҳ������ */
	var PAGE_ROW_COUNT = 20;

	/** ��ҳ������ǰ׺ */
	var PAGINATION_PREFIX = "Pagination_";
	
	/** ������ */
	var TOTAL_ROW_COUNT = PAGINATION_PREFIX + "TOTAL_ROW_COUNT";

	/** ҳ����ʼ��key */
	var PAGE_BEGIN_WITH = "pageBeginWith";

	/** ���صĵ�ǰҳ��ʼ��key */
	var CURRENT_PAGE_BEGIN_WITH = PAGINATION_PREFIX + "pageBeginWith";

	/** ���ص���ҳ��key */
	var TOTAL_PAGE = PAGINATION_PREFIX + "TOTAL_PAGE";
	
	//�����ҳ��ǩ
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
		
		var firstLink = getPageLink(0,hasPrevious,"��ҳ");
		var preLink = getPageLink(previousBeginWith,hasPrevious,"��һҳ");
		var nextLink = getPageLink(nextBeginWith,hasNext,"��һҳ");
		var lastLink = getPageLink(((totalPage-1)*PAGE_ROW_COUNT),hasNext,"ĩҳ");
		$("#totalCountDiv").html(totalRowCount);
		$("#beginPageDiv").html(currentPage);
		$("#totalPageDiv").html(totalPage);
		$("#firstLinkDiv").html(firstLink);
		$("#preLinkDiv").html(preLink);
		$("#nextLinkDiv").html(nextLink);
		$("#lastLinkDiv").html(lastLink);
	}
	
	//��ȡ��ѯ�������������
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
	
	//��ת����start��ʼ����
	function getPageLink(start, has, pageName) {
		var linkStr="";
		if (has) {
			linkStr = "<a class=a href=\"#\" onClick=\"goTo(" + start + ");\" >" + pageName + "</a>";
		} else {
			linkStr = pageName;
		}
		return linkStr;
	}
	
	//��ת��ָ������λ��
	function goTo(start){
		//��ѯ�б�����Ⱦ
		var keyword = $("#keyword").val();
		var qType = 0;
		var	enpData = findEnterprise(keyword,qType,start,PAGE_ROW_COUNT);
		var totCount = enpData.response.numFound;
		fillEnterprise(qType,enpData.response.docs,"enpListTable");
		lazyClear("msg1");//�ӳ������ʾ��Ϣ
		//��ʼ����ҳ
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
			alert('������������ҳ�룡');
		} else if (isNaN(goToNum)) {
			alert('������������ҳ�룡');
			$("#Pagination_PAGE_GO_TO").val("");
		} else if (parseInt(goToNum, 10) <=0) {
			alert('������������ҳ�룡');
			$("#Pagination_PAGE_GO_TO").val("");
		} else if (parseInt(goToNum, 10) > parseInt(totalPage, 10)) {
			alert('�㶨λ��ҳ�����ܴ��ڵ�ǰ��������ҳ����');
			$("#Pagination_PAGE_GO_TO").val("");
		} else {
			var start = (goToNum-1)*PAGE_ROW_COUNT;
			start = parseInt(start);
			goTo(start);
		}
		return false;
	}

	
