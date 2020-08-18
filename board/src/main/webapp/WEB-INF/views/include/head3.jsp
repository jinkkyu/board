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
  var dept_code = "";
	var adesc = "";
	var depth = "";
	var group_id = "";
	var grid_store;	
	var store;
	Ext.require(['Ext.data.*',
	             'Ext.tree.*',
	             'Ext.window.*',
	             'Ext.ajax.*',
	             'Ext.util.*',
	             'Ext.grid.*']);
	
	Ext.define('organization',{
			extend: 'Ext.data.Model',
			fields: ['parent_dept','parent_desc','dept_code','adesc','depth','use_yn','dept_group','modified_id','modified_date']
	});
	
	Ext.define('tree_model',{
		extend: 'Ext.data.Model',
		fields: ['id','group_id','up_id','depth','text']
	});
	Ext.onReady( function(){
		 store = Ext.create('Ext.data.TreeStore',{
			model: 'tree_model',
			proxy: {
				type: 'ajax',
				url: '/test/getTreeList',
				reader: {
					type:'json',
					root:'tree_model'
				}
			}
			
		});
		
		var tree = Ext.create('Ext.tree.Panel',{
			store: store,
			rootVisible: false,
			useArrows: true,
			frame: false,
			renderTo: 'organization_tree',
			width: 190,
			autoHeight: true,
			header: false,
			border:false,
			listeners:{
				itemdblclick: function( dv, record, item, index, e ){
					onLoad(record.get("id"),record.get("text"),record.get("depth"),record.get("group_id"));
				},
				itemclick: function( dv, record, item, index, e ){
					 dept_code = record.get("id");
					 adesc = record.get("text");
					 group_id = record.get("group_id");
				}
			},
			dockedItems: [{
				xtype: 'toolbar',
				items: {
					text:'조직도',
					handler: function(){
						var records = tree.getView().getChecked(), names=[];
						Ext.Array.each( records, function(rec){
								names.push(rec.get('text'));
						});
						Ext.MessageBox.show({
							title: 'Selected Nodes',
							msg: names.join('<br/>'),
							icon: Ext.MessageBox.INFO
						});
					}
				}
			}]
		});
		
		grid_store = Ext.create('Ext.data.Store',{
			autoLoad: true,
			autoSync: true,
			model: 'organization',
			proxy:{
				type:'ajax',
				url:'/test/getOrganizationList',
				reader: {
					type: 'json',
					root: 'organization'
				}
			}
		});
		
		var organization_grid = Ext.create('Ext.grid.Panel',{
			columnLines: true,
			forceFit: true,
			cls: "table01",
			autoWidth: true,
			height: 382,
			loadMask: true,
			store: grid_store,
			enableColumnResize: false,
			border: false,
			viewConfig: {
				forceFit: true,
				loadMask: {msg:'로딩중...'},
				listeners: {
					itemdblclick: function(dv, record, item, index, e){
						onDisplay("detail");
						onView(record.get("dept_code"), record.get("parent_dept"),record.get("parent_desc"));
					}
				}
			},
			columns: [{ header:'상위부서', align:'center', dataIndex:'parent_dept' },
			          { header:'부서코드', align:'center', dataIndex:'dept_code'},
			          { header:'부서명', align:'center', dataIndex:'adesc'},
			          { header:'사용여부', align:'center', dataIndex:'use_yn'}],
			renderTo:'organization_grid'
		});
	});
	
	function onView(dept_code, parent_dept,parent_desc){
		
		frm.dept_code.value = dept_code;
		frm.parent_dept.value = parent_dept;
		onDisplay("detail");
		$.ajax({
			url:'/admin/Organization/DetailInfo.hanil',
			type:'post',
			data:$(frm).serialize(),
			error:function(){
				
			},
			success:function(obj){
				document.getElementById("txt_parent_dept").value = obj.organization.parent_dept;
				document.getElementById("txt_parent_desc").value = parent_desc;
				document.getElementById("txt_dept_code").value = obj.organization.dept_code;
				document.getElementById("txt_dept_code").readOnly = true;
				document.getElementById("txt_adesc").value = obj.organization.adesc;
				
				if(obj.organization.use_yn == "Y"){
					document.getElementById("use_y").checked=true;
				}else{
					document.getElementById("use_n").checked=true;
				}
				
				btnDisplay("update");
			}
		});
	}
	
	function onInsert(){
		if( !confirm("입력한 내용을 저장하시겠습니까?")){
			return;
		}
		
		if( document.getElementById("txt_dept_code").value=="" ){
			alert("부서 코드를 입력하지 않았습니다.");
			return;
		}
		
		if( document.getElementById("txt_adesc").value=="" ){
			alert("부서명을 입력하지 않았습니다.");
			return;
		}
		frm.parent_dept.value = document.getElementById("txt_parent_dept").value;
		frm.dept_code.value = document.getElementById("txt_dept_code").value;
		if(frm.parent_dept.value =="*"){
			frm.dept_group.value = document.getElementById("txt_dept_code").value;
		}else{
			frm.dept_group.value = document.getElementById("txt_parent_dept").value;
		}
		if(group_id ==""){
			frm_dept_group = document.getElementById("txt_dept_code");
		}else{
			frm.dept_group.value = group_id;	
		}
		
		frm.adesc.value = document.getElementById("txt_adesc").value;
		frm.use_yn.value = document.getElementById("use_y").checked==true?"Y":"N";
		$.ajax({
			url:'/admin/Organization/insert.hanil',
			type:'post',
			data:$(frm).serialize(),
			error:function(){
				
			},
			success:function(obj){
				
				if(obj.count==1){
					alert("저장 완료 되었습니다.");
					onDisplay("list");
					grid_store.load();
					store.load();
					OnInit();	
				}else if(obj.count==99){
					alert("중복된 데이터가 있습니다.");
					document.getElementById("txt_dept_code").focus();
				}
				
			}
		});
	}
	
	function onUpdate(){
		if(!confirm("입력한 내용을 수정하시겠습니까?")){
			return;
		}
		
		if(document.getElementById("txt_adesc").value==""){
			alert("부서명을 입력해 주세요.");
			return;
		}
		
		frm.parent_dept.value = document.getElementById("txt_parent_dept").value;
		frm.dept_code.value = document.getElementById("txt_dept_code").value;
		frm.adesc.value = document.getElementById("txt_adesc").value;
		frm.use_yn.value = document.getElementById("use_y").checked==true?"Y":"N";
		$.ajax({
			url:'/admin/Organization/update.hanil',
			type:'post',
			data:$(frm).serialize(),
			error:function(){
				
			},
			success:function(obj){
				alert("수정 완료 되었습니다.");
				onDisplay("list");
				grid_store.load();
				store.load();
				OnInit();	
			}
		});
	}
	
	function onDelete(){
		if(!confirm("삭제하시겠습니까?")){
			return;
		}
		
		frm.dept_code.value = document.getElementById("txt_dept_code").value;
		$.ajax({
			url:'/admin/Organization/delete.hanil',
			type: 'post',
			data:$(frm).serialize(),
			error:function(){
				
			},
			success:function(obj){
				if(obj.count ==1){
					alert("삭제 완료 되었습니다.");
					grid_store.load();
					onDisplay("list");
					store.load();
					OnInit();
				}else if(obj.count ==99){
					alert("하위 조직부터 삭제 해주십시오.");
					grid_store.load();
					onDisplay("list");
					store.load();
				}
			}
		});
	}
	
	function onLoad(parent_dept,parent_desc,depth,dept_group){
		document.getElementById("txt_parent_dept").value = parent_dept;
		document.getElementById("txt_parent_dept").readOnly = true;
		document.getElementById("txt_parent_desc").value = parent_desc;
		document.getElementById("txt_parent_desc").readOny = true;
		frm.dept_group.value = dept_group;
		frm.depth.value = depth;
		grid_store.load( {params: { parent_dept: parent_dept}});
	}
	
	function onInit(){
		document.getElementById("txt_parent_dept").value="";
		document.getElementById("txt_parent_desc").value="";
		document.getElementById("txt_dept_code").value="";
		document.getElementById("txt_adesc").value="";
		document.getElementById("use_y").checked=true;

	}
	
	function btnDisplay(value){
		if(value=="add"){
			document.getElementById("btn_insert").style.display="";
			document.getElementById("btn_update").style.display="none";
			document.getElementById("btn_delete").style.display="none";
		}else if(value=="update"){
			document.getElementById("btn_insert").style.display="none";
			document.getElementById("btn_update").style.display="";
			document.getElementById("btn_delete").style.display="";
		}
		
		document.getElementById("btn_init").style.display="";
	}
	
	function onDisplay(value){
		if(value=="list"){
			document.getElementById("list").style.display = "";
			document.getElementById("detail").style.display="none";
			btnDisplay("add");
			onInit();
		}else if(value=="detail"){
			btnDisplay("update");
			document.getElementById("list").style.display="none";
			document.getElementById("detail").style.display="block";
			if(dept_code !=""){
				document.getElementById("txt_parent_dept").value = dept_code;
				document.getElementById("txt_parent_desc").value = adesc;
				document.getElementById("txt_dept_code").readOnly = false;
				
			}else{
				document.getElementById("txt_parent_dept").value = "*";
				document.getElementById("txt_parent_desc").value = "한일시멘트";
				document.getElementById("txt_dept_code").readOnly = false;
			}
			document.getElementById("txt_parent_dept").readOnly = true;
			document.getElementById("txt_parent_desc").readOnly = true;
			
			
		}else if(value=="add"){
			onInit();
			btnDisplay("add");
			document.getElementById("list").style.display="none";
			document.getElementById("detail").style.display="block";
			if(dept_code !=""){
				document.getElementById("txt_parent_dept").value = dept_code;
				document.getElementById("txt_parent_desc").value = adesc;
				document.getElementById("txt_dept_code").readOnly = false;
				
			}else{
				document.getElementById("txt_parent_dept").value = "*";
				document.getElementById("txt_parent_desc").value = "한일시멘트";
				document.getElementById("txt_dept_code").readOnly = false;
			}
			document.getElementById("txt_parent_dept").readOnly = true;
			document.getElementById("txt_parent_desc").readOnly = true;
			
		}else if(value=="top"){
			onInit();
			btnDisplay("add");
			document.getElementById("list").style.display="none";
			document.getElementById("detail").style.display="block";				
			document.getElementById("txt_parent_dept").value = "*";
			document.getElementById("txt_parent_desc").value = "한일시멘트";
			document.getElementById("txt_dept_code").readOnly = false;
			document.getElementById("txt_parent_dept").readOnly = true;
			document.getElementById("txt_parent_desc").readOnly = true;
			group_id = "";
			
		}
	}
</script>

  
  
  


</head>
