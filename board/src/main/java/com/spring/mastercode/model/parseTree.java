package com.spring.mastercode.model;

import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;

public class parseTree {
	
	public List<TreeModel> generateTreeModelList( List<TreeModel> list ) {
		// ArrayList<TreeModel> return_list = new ArrayList<TreeModel>();
		
		ArrayList<TreeModel> parent_list = new ArrayList<TreeModel>();
		Hashtable<String, ArrayList<TreeModel>> hashtable = new Hashtable<String, ArrayList<TreeModel>>();
		
		for( int idx = 0; idx < list.size(); idx++ ) {
			// 모델에 저장된 데이터에서 하위 노드를 가진 부분을 Key로 설정하여 저장한다.
			if( list.get( idx ).getSub_cnt() > 0 ) {
				ArrayList<TreeModel> parent = new ArrayList<TreeModel>();
				parent.add( list.get( idx ) );
				hashtable.put( list.get( idx ).getId(), parent );
			}

			// 최상위 노드 저장
			if( list.get( idx ).getUp_id() == null || list.get( idx ).getUp_id().equals( "NULL" ) || list.get( idx ).equals( "null" ) || list.get( idx ) == null ) {
				parent_list.add( list.get( idx ) );
			}
		}

		// 모델에 저장된 내용을 HashTable에 ArrayList로 각 그룹별로 묶어서 담는다
		for( int idx = 0; idx < list.size(); idx++ ) {
			for( int key_idx = 0; key_idx < hashtable.keySet().toArray().length; key_idx++ ) {
				if( list.get( idx ).getUp_id() != null ) {
					if( list.get( idx ).getUp_id().equals( hashtable.keySet().toArray()[key_idx] ) ) {
						ArrayList<TreeModel> child = hashtable.get( hashtable.keySet().toArray()[key_idx] );
						child.add( list.get( idx ) );
						hashtable.put( hashtable.keySet().toArray()[key_idx].toString(), child );
					}
				} else {
					System.out.println( "# NULL이 아닌것? # : " + list.get( idx ).getText() );
				}
			}
		}

		// 최상위 노드를 기준으로 각 하위 노드를 찾아 데이터를 셋팅시킨다.
		for( int parent_idx = 0; parent_idx < parent_list.size(); parent_idx++ ) {
			System.out.println( "# KEY # : " + parent_list.get( parent_idx ).getText() );
			dataSetting( parent_list.get( parent_idx ), hashtable );
		}
		
		return parent_list;
	}
	
	// 자식 노드를 찾는 부분
	public String findChild( String group, Hashtable<String, ArrayList<TreeModel>> data ) {
		for( int idx = 0; idx < data.keySet().toArray().length; idx++ ) {
			ArrayList<TreeModel> tmp = data.get( data.keySet().toArray()[idx] );
			if( tmp.get( 0 ).getUp_id() != null ) {
				if( tmp.get( 0 ).getUp_id().equals( group ) ) {
					return tmp.get( 0 ).getId();
				}
			}
		}
		return "";
	}
	
	// 트리 데이터 바인딩
	public void dataSetting( TreeModel model, Hashtable<String, ArrayList<TreeModel>> data ) {
		String child_code = findChild( model.getId(), data );
		ArrayList<TreeModel> tmp = data.get( model.getId() );
		if( child_code.equals( "" ) ) {
			if( tmp.size() > 0 ) {
				for( int idx = 1; idx < tmp.size(); idx++ ) {
					// System.out.println( "<li id=" + tmp.get( idx ).getScode() + "><a>" + tmp.get( idx ).getGroupname() + "</a></li>" );
					// System.out.println( tmp.get( idx ).getText() );
					// model.getChildren().add( tmp.get( idx ) );
					// System.out.println( tmp.get( idx ).getText() );
					model.getMessage().add( tmp.get( idx ) );
				}
			}
		} else {
			// System.out.println( "<li id=" + tmp.get( 0 ).getScode() + "><a>" + tmp.get( 0 ).getGroupname() + "</a>" );
			// System.out.println( tmp.get( 0 ).getText() );
			// model.getMessage().add( tmp.get( 0 ) );
			if( tmp.size() > 0 ) {
				// System.out.println( "<ul>" );
			}
			TreeModel child_model = new TreeModel();
			child_model.setId( child_code );
			dataSetting( child_model, data );
			if( tmp.size() > 0 ) {
				for( int idx = 1; idx < tmp.size(); idx++ ) {
					// System.out.println( "<li id=" + tmp.get( idx ).getScode() + "><a>" + tmp.get( idx ).getGroupname() + "</a></li>" );
					// System.out.println( tmp.get( idx ).getText() );
					// model.getMessage().add( tmp.get( idx ) );
					// System.out.println( tmp.get( idx ).getText() );
				}
			}
		}
	}
	
}
