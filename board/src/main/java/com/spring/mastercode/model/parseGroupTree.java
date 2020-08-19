package com.spring.mastercode.model;

import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;

public class parseGroupTree {
	public List<GroupTreeModel> generateGroupTree( List<GroupTreeModel> param_list ) {
		// Tree로 변환되는 ArrayList
		ArrayList<GroupTreeModel> tree_list = new ArrayList<GroupTreeModel>();
		// Tree의 계층을 저장하기 위한 HashTable
		Hashtable<String, GroupTreeModel> hash_table = new Hashtable<String, GroupTreeModel>();

		for( int idx = 0; idx < param_list.size(); idx++ ) {
			// 상위 노드 저장
			if( !hash_table.containsKey( param_list.get( idx ).getGroup_id() ) ) {
				GroupTreeModel parent_model = param_list.get( idx );
				hash_table.put( param_list.get( idx ).getId(), parent_model );
				
				tree_list.add( param_list.get( idx ) );
			} else {
				// 하위 노드를 저장하기 위해서 HashTable에 저장된 Key로 해당 List를 찾음
				for( int hash_idx = 0; hash_idx < hash_table.keySet().toArray().length; hash_idx++ ) {
					// 같은 GroupID를 가진 정보를 찾아서 처리
					if( param_list.get( idx ).getGroup_id().equals( hash_table.keySet().toArray()[hash_idx].toString() ) ) {
						GroupTreeModel child_model = hash_table.get( hash_table.keySet().toArray()[hash_idx].toString() );

						List<GroupTreeModel> child_list = findTreeGroupModel( child_model, param_list.get( idx ) );
						
						child_model.setTree_model( child_list );
						
						hash_table.put( hash_table.keySet().toArray()[hash_idx].toString(), child_model );
					}
				}
			}
		}
		
		return tree_list;
	}
	
	// 하위 List 정보를 찾아서 저장하는 부분
	public List<GroupTreeModel> findTreeGroupModel( GroupTreeModel child_model, GroupTreeModel param_model ) {
		List<GroupTreeModel> model = child_model.getTree_model();
		// 하위 노드의 상위 ID와 상위 노드의 ID 값이 같을 경우엔 해당 List에 추가 한다.
		if( child_model.getId().equals( param_model.getUp_id() ) ) {
			model.add( param_model );
		} else {
			//하위 노드의 상위 ID와 상위 노드의 ID 값이 같지 않을 경우엔 재귀로 한번 더 List를 찾게 한다. 
			for( int idx = 0; idx < child_model.getTree_model().size(); idx++ ) {
				List<GroupTreeModel> childs_model = findTreeGroupModel( child_model.getTree_model().get( idx ), param_model );
				
				// 찾은 List에서 상위 노드와 하위 노드의 값이 일치 할 경우에 저장한다.
				if( child_model.getId().equals( param_model.getUp_id() ) ) {
					childs_model.add( param_model );
				}
			}
		}
		return model;
	}
}

