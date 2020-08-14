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
  Ext.onReady(function(){
		Ext.create('Ext.tree.Panel',{
			width : 500,
			height : 800,
			title : '한일네트웍스 조직도 ',
			store : Ext.create('Ext.data.TreeStore',{
				 root : {
					    text: '한일네트웍스',
					    expanded: true,
					    children: [
							{
					            text: '임원실',
					            expanded: true,
					            children: [{ 
				                		leaf:true, 
				                		text: '박지훈 대표이사' 
			                		},{ 
				                		leaf:true, 
				                		text: '허기수 부사장' 
			                		},{ 
				                		leaf:true, 
				                		text: '이재승 전무' 
			                		}]
					        },{
					            text: 'DSC사업부',
					            expanded: true,
					            children: [{ 
					            		leaf:true, 
					            		text: '차장-이순신' 
				            		},{ 
			            				leaf:true, 
			            				text: '과장-장영실' 
		            				}]
					        },{
					            text: 'SM사업부',
					            expanded: false,
					            children: [{ 
				                		leaf:true, 
				                		text: '민기혁 상무보'
				                		
						                		},{
						                			text: '사업1팀',
						                			expanded:false,
						                			children:[{
								                				text: 'ERP1파트',
								                				expanded:false,
								                			},{
								                				text: 'ERP2파트',
								                				expanded:false,
								                			},{
								                				text: 'ERP3파트',
								                				expanded:false,
								                			}]
						                		},{
						                			text: '사업2팀',
						                			expanded:false,
						                			children:[{
								                				text: '인프라파트',
								                				expanded:false,
						                			},{
						                				text: '그룹웨어파트',
						                				expanded:false,
						                			},{
						                				text: '웹파트',
						                				expanded:false,
						                			}]
			                		}]
					        },{
					            text: 'SS사업부',
					            expanded: false,
					            children: [{ 
				                		leaf:true, 
				                		text: '부장-스티브잡스' 
			                		},{ 
		                				leaf:true, 
		                				text: '차장-빌게이츠' 
	                				},{ 
	              						leaf:true, 
	              						text: '대리-주커버크' 
	             						},{ 
	             							leaf:true, 
	             							text: '사원-몽고' 
	           						}]
					        },{
					            text: '보안사업부문',
					            expanded: false,
					            children: [{ 
				                		leaf:true, 
				                		text: '부장-스티브잡스' 
			                		},{ 
		                				leaf:true, 
		                				text: '차장-빌게이츠' 
	                				},{ 
	              						leaf:true, 
	              						text: '대리-주커버크' 
	             						},{ 
	             							leaf:true, 
	             							text: '사원-몽고' 
	           						}]
					        },{
					            text: '경영지원팀',
					            expanded: false,
					            children: [{ 
				                		leaf:true, 
				                		text: '부장-스티브잡스' 
			                		},{ 
		                				leaf:true, 
		                				text: '차장-빌게이츠' 
	                				},{ 
	              						leaf:true, 
	              						text: '대리-주커버크' 
	             						},{ 
	             							leaf:true, 
	             							text: '사원-몽고' 
	           						}]
					        }
					    ]
					}
			}),
			renderTo : 'tree'
		})
})
</script>

  
  
  


</head>
