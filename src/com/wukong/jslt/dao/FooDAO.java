package com.wukong.jslt.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.wukong.jslt.HibernateSessionFactory;
import com.wukong.jslt.pojo.Foo;

public class FooDAO {
	private static FooDAO mBookInfoDao = null;

	// 构造方法私有化,外界无法直接实例化
	private FooDAO() {

	}

	/**
	 * 懒汉单例模式 需要时才生成唯一实例
	 * 
	 * @return
	 */
	synchronized public static FooDAO getInstance() {
		if (mBookInfoDao == null) {
			mBookInfoDao = new FooDAO();
		}
		return mBookInfoDao;
	}

	public static Session getSession() {
		return HibernateSessionFactory.getSession();
	}
	
	@SuppressWarnings("unchecked")
	public List<Foo> findAll(){
		String hql="from Foo";
		Session session = getSession();
		Query query = session.createQuery(hql);
		List<Foo> all = query.list();
		session.close();
		return all;
	}
	
	public void save(Foo transientInstance){
		Session session=getSession();
		Transaction tran=null;
		try{
			tran=session.beginTransaction();
			session.save(transientInstance);
			tran.commit();
		}catch(Exception e){
			tran.rollback();
			e.printStackTrace();
		}finally{
			session.close();
		}
	}
	
	public Foo getUniqueFooById(int fooId) {
		Session session = getSession();
		String hql = "from Foo foo where foo.id=?";
		Query query = session.createQuery(hql);
		query.setInteger(0, fooId);
		Foo foo = (Foo) query.uniqueResult();
		return foo;
	}
	
	public void updateFooVerifyStatusById(int fooId, boolean b){
		Session session = getSession();
		String hql = "update Foo foo set foo.verifyStatus=? where foo.id=?";
		
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			Query query = session.createQuery(hql);
			query.setBoolean(0, b);
			query.setInteger(1, fooId);
			query.executeUpdate();
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
	}
	
	public void updateFooProcessStatusById(int fooId, int process){
		Session session = getSession();
		String hql = "update Foo foo set foo.processStatus=? where foo.id=?";
		
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			Query query = session.createQuery(hql);
			query.setInteger(0, process);
			query.setInteger(1, fooId);
			query.executeUpdate();
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
	}

	public void deleteFooById(Integer id) {
		Session session=getSession();
		Transaction tran=null;
		try{
			tran=session.beginTransaction();
			Foo foo=getUniqueFooById(id);
			session.delete(foo);
			tran.commit();
		}catch(Exception e){
			tran.rollback();
			e.printStackTrace();
		}finally{
			session.close();
		}
	}
}
