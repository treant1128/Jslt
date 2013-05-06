package com.wukong.jslt.dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.wukong.jslt.HibernateSessionFactory;
import com.wukong.jslt.pojo.Foo;
import com.wukong.jslt.pojo.User;

public class UserDAO {
	private static UserDAO mBookInfoDao = null;

	// 构造方法私有化,外界无法直接实例化
	private UserDAO() {

	}

	/**
	 * 懒汉单例模式 需要时才生成唯一实例
	 * 
	 * @return
	 */
	synchronized public static UserDAO getInstance() {
		if (mBookInfoDao == null) {
			mBookInfoDao = new UserDAO();
		}
		return mBookInfoDao;
	}

	public static Session getSession() {
		return HibernateSessionFactory.getSession();
	}
	
	public User getUniqueUserByName(String name) {
		Session session = getSession();
		String hql = "from User user where user.name=?";
		Query query = session.createQuery(hql);
		query.setString(0, name);
		User user = (User) query.uniqueResult();
		return user;
	}
	
	public void updateUserPwdByName(String name, String pwd){
		Session session = getSession();
		String hql = "update User user set user.pwd=? where user.name=?";
		
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			Query query = session.createQuery(hql);
			query.setString(0, pwd);
			query.setString(1, name);
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
	
}
