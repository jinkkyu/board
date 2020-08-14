<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  

  <title>코로나 19</title>
	
  <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
  <!-- Bootstrap core CSS -->
  <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="/resources/css/shop-homepage.css" rel="stylesheet">
  
  <!-- Ext JS 적용 -->
  <script type="text/javascript" src="/resources/extjs/ext-all.js"></script>
  <link rel="stylesheet" type="text/css" href="/resources/extjs/css/ext-all.css">
  <script type="text/javascript" src="/resources/extjs/locale/ext-lang-ko.js" charset="utf-8"></script>
  
  <script type="text/javascript">
  var grid_store;
	
	Ext.require(['Ext.data.*',
	             'Ext.grid.*']);
	
	Ext.define('commonCode',{
		extend: 'Ext.data.Model',
		fields: ['mcode','mdesc','remarks','use_yn','modify_id','modify_date']
	});
	Ext.onReady( function(){
		
		grid_store = Ext.create('Ext.data.Store',{
			autoLoad: true,
			authSync: true,
			model: 'commonCode',
			proxy: {
				type: 'ajax',
				url:'/test/getMasterList',
				reader: {
					type:'json',
					root:'commonCode'
				}
			}
		});
		
		var common_grid = Ext.create('Ext.grid.Panel',{
			columnLines: true,
			forceFit: true,
			cls: "table01",
			autoWidth: true,
			height: 300,
			enableColumnResize: false,
			loadMask: true,
			store: grid_store,
			border:true,
			viewConfig: {
				forceFit: true,
				loadMask: {msg:'로딩중...'},
				listeners: {
					itemdblclick: function(dv, record, item, index, e){
						onView( record.get("mcode") );
					}
				}
			},
			columns:[Ext.create('Ext.grid.RowNumberer'),
			         {header:'주 코드', align:'center',dataIndex:'mcode'},
			         {header:'주 코드명',align:'center',dataIndex:'mdesc'}],
			renderTo:'common_grid'
		});
	});
	
	function onCodeSearch(){
		var search_field = document.getElementById("search_field").value;
		var search_words = document.getElementById("search_words").value;
		alert(search_words);
		grid_store.load( {params: {search_field: search_field, search_words:encodeURI(search_words)}});
	}
	
	function onView(mcode){
		var frm = frm_code;
		
		//alert(mcode);
		
		frm.mcode.value = mcode;
		
		$.ajax({
			url:'/test/getMasterDetail',
			type:'post',
			data:$(frm).serialize(),
			error:function(){
				alert("오류에유");
			},
			success:function(obj){
				//alert(obj.mcode + "입니다.");
				frm_code.mcode.value = obj.mcode;
				document.getElementById("txt_code_id").value = obj.mcode;
				document.getElementById("txt_code_name").value = obj.mdesc;
				
				if(obj.use_yn == "Y"){
					document.getElementById("use_y").checked = true;
				} else{
					document.getElementById("use_n").checed = true;
				}
				document.getElementById("txt_code_remarks").value = obj.remarks;
				btnDisplay("update");
			}
		});
	}
	
	function onInsert(){
		if(!confirm("입력한 내용을 저장하시겠습니까?")){
			return;
		}
		
		if(document.getElementById("txt_code_name").value==""){
			alert("코드명을 입력하지 않았습니다.");
			return;
		}
		
		if(document.getElementById("txt_code_id").value==""){
			alert("코드를 입력하지 않았습니다.");
			return;
		}
		
		var frm = frm_code;
		
		frm.mcode.value = document.getElementById("txt_code_id").value;
		frm.mdesc.value = document.getElementById("txt_code_name").value;
		frm.remarks.value = document.getElementById("txt_code_remarks").value;
		frm.use_yn.value = document.getElementById("use_y").checked==true?"Y":"N";
		
		$.ajax({
			url:'/test/insertMaster',
			type: 'post',
			data:$(frm).serialize(),
			error:function(){
				alert("중복된 데이터가 있습니다.");
				document.getElementById("txt_code_id").focus();
			},
			success:function(obj){

					alert("저장 하였습니다.");
					grid_store.load();
					onInit();
				
			}
		});
	}
	
	function onUpdate(){
		if(!confirm("입력한 내용을 수정하시겠습니까?")){
			return;
		}
		
		if(document.getElementById("txt_code_id").value == ""){
			alert("코드를 입력하지 않았습니다.");
			return;
		}
		
		if(document.getElementById("txt_code_name").value == ""){
			alert("코드명을 입력하지 않았습니다.");
			return;
		}
		
		var frm = frm_code;
		frm.mcode.value = frm_code.mcode.value;
		frm.mdesc.value = document.getElementById("txt_code_name").value;
		frm.remarks.value = document.getElementById("txt_code_remarks").value;
		frm.use_yn.value = document.getElementById("use_y").checked==true?"Y":"N";
		
		$.ajax({
			url:'/test/updateMaster',
			type:'post',
			data:$(frm).serialize(),
			error:function(){
				
			},
			success:function( obj ){
				alert("수정 완료 하였습니다.");
				grid_store.load();
				
				onInit();
			}
		});
	}
	
	function onDelete(){
		if(!confirm("삭제하시겠습니까?")){
			return;
		}
		
		var frm = frm_code;
		frm.mcode.value = frm_code.mcode.value;
		alert(frm.mcode.value);
		$.ajax({
			url:'/test/deleteMaster',
			type:'post',
			data:$(frm).serialize(),
			error:function(){
				
			},
			success:function(obj){
				alert("삭제 완료 하였습니다.");
				grid_store.load();
				
				onInit();
			}
		});
	}
	
	function onInit(){
		frm_code.mcode.value = "";
		document.getElementById("txt_code_id").value="";
		document.getElementById("txt_code_id").readOnly=false;
		document.getElementById("txt_code_name").value = "";
		document.getElementById("txt_code_remarks").value = "";
		document.getElementById("use_y").checked = true;
		
		btnDisplay("add");
	}
	
	function btnDisplay( value ){
		if( value == "add" ){
			document.getElementById("btn_insert").style.display="";
			document.getElementById("btn_update").style.display="none";
			document.getElementById("btn_delete").style.display="none";
		}else if( value=="update" ){
			document.getElementById("txt_code_id").readOnly = true;
			document.getElementById("btn_insert").style.display="none";
			document.getElementById("btn_update").style.display="";
			document.getElementById("btn_delete").style.display="";
		}
		
		document.getElementById("btn_init").style.display="";
	}
</script>

 <%
String search_field = request.getParameter("search_field");
String search_words = request.getParameter("search_words");
%>

<c:set var="search_field" value="<%=search_field%>" />
<c:set var="search_words" value="<%=search_words%>" />
  
  


</head>
