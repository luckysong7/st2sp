package com.forever.common.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

@Repository("dao")
public class IBatisDaoImpl implements CommonDAO {
	// @Resource �� �̸��� ������ �� ������ @Autowired�� �̸��� ������ �� ���� id ���� ��ġ�ؾ��Ѵ�.
	
	@Autowired
	private SqlMapClientTemplate sqlMapClientTemplate;
	
	// ******************************************************************
	// ������ �߰�
    public void insertData(String id, Object value) throws Exception {
		try {
			sqlMapClientTemplate.getSqlMapClient().startTransaction();
			sqlMapClientTemplate.getSqlMapClient().getCurrentConnection().setAutoCommit( false );
			sqlMapClientTemplate.insert(id, value);  // return Object
			sqlMapClientTemplate.getSqlMapClient().getCurrentConnection().commit();
		} catch (Exception e) {
			System.out.println(e.toString());
			
			throw e;
		} finally {
			sqlMapClientTemplate.getSqlMapClient().getCurrentConnection().setAutoCommit( true );
			sqlMapClientTemplate.getSqlMapClient().endTransaction();
		}    	
    }
    
	// ******************************************************************
	// ������ ����
    public int updateData(String id, Object value) throws Exception {
		int result = 0;
		
		try {
	   	    result = sqlMapClientTemplate.update(id, value);
		} catch (Exception e) {
			System.out.println(e.toString());
			
			throw e;
		}
		
		return result;
    }
    public int updateData(String id, Map<String, Object> map) throws Exception {
		int result = 0;
		
		try {
	   	    result = sqlMapClientTemplate.update(id, map);
		} catch (Exception e) {
			System.out.println(e.toString());
			
			throw e;
		}
		
		return result;
    }
    
	// ******************************************************************
	// ������ ����
	public int deleteData(String id, Map<String, Object> map) throws Exception {
		int result = 0;

		try {
			result = sqlMapClientTemplate.delete(id, map);
		} catch (Exception e) {
			System.out.println(e.toString());
			
			throw e;
		}

		return result;
    }
	public int deleteData(String id, Object value) throws Exception {
		int result = 0;
		
		try {
			result = sqlMapClientTemplate.delete(id, value);
		} catch (Exception e) {
			System.out.println(e.toString());
			
			throw e;
		}

		return result;
    }
	public int deleteAll(String id) throws Exception {
		int result = 0;
		
		try {
	    	result = sqlMapClientTemplate.delete(id);
		} catch (Exception e) {
			System.out.println(e.toString());
			
			throw e;
		}

		return result;
    }

	// ******************************************************************
	// �� �ڵ� �� / �ִ� �� ���ϱ�
	public int getIntValue(String id, Map<String, Object> map) throws Exception {
		int num = 0;
		num = ((Integer)sqlMapClientTemplate.queryForObject(id, map)).intValue();
		return num;
    }
	public int getIntValue(String id, Object value) throws Exception {
		int num = 0;
		num = ((Integer)sqlMapClientTemplate.queryForObject(id, value)).intValue();
		return num;
    }
	public int getIntValue(String id) throws Exception {
		int num = 0;
		num = ((Integer)sqlMapClientTemplate.queryForObject(id)).intValue();
		return num;
    }
	
	// ******************************************************************
	// ���̺��� ���ڵ带 ����Ʈ�� ����
	@SuppressWarnings("unchecked")
	public List<Object> getListData(String id, Map<String, Object> map) throws Exception {
		List<Object> lists = (List<Object>) sqlMapClientTemplate.queryForList(id, map);	
		return lists;
	}
	@SuppressWarnings("unchecked")
	public List<Object> getListData(String id, Object value) throws Exception {
		List<Object> lists = (List<Object>) sqlMapClientTemplate.queryForList(id, value);	
		return lists;
	}
	@SuppressWarnings("unchecked")
	public List<Object> getListData(String id) throws Exception {
		List<Object> lists = (List<Object>) sqlMapClientTemplate.queryForList(id);	
		return lists;
	}
	
	// ******************************************************************
	// �ش� ���ڵ� ��������
	public Object getReadData(String id) throws Exception {
		return  sqlMapClientTemplate.queryForObject(id);
	}
	public Object getReadData(String id, Object value) throws Exception {
		return  sqlMapClientTemplate.queryForObject(id, value);
	}
	public Object getReadData(String id, Map<String, Object> map) throws Exception {
		return  sqlMapClientTemplate.queryForObject(id, map);
	}
	

	// ******************************************************************
	// ���ν���
	@Override
	public void callInTypeProcedure(String id, Object value) throws Exception{
		try {
			sqlMapClientTemplate.queryForObject(id, value);
		} catch (Exception e) {
			System.out.println(e.toString());
			
			throw e;
		}
	}

	@Override
	public Map<String, Object> callOutTypeProcedureMap(String id, Map<String, Object> map) throws Exception{
		try {
			sqlMapClientTemplate.queryForObject(id, map);
			return map;
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return null;
	}
	
	@Override
	public Object callOutTypeProcedureData(String id, Map<String, Object> map) throws Exception{
		try {
			return sqlMapClientTemplate.queryForObject(id, map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return null;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Object> callOutTypeProcedureList(String id, Map<String, Object> map) throws Exception{
		try {
			return (List<Object>) sqlMapClientTemplate.queryForList(id, map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return null;
	}
}
