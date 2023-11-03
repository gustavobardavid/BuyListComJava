package br.com.programize.dao;

import java.util.List;


import javax.persistence.EntityManager;

import br.com.programize.connection.ConnectionFactory;
import br.com.programize.model.Item;
public class ItemDAO {
	
	public Item save(Item item) {
		EntityManager em = new ConnectionFactory().getConnection();
		
		try {
			em.getTransaction().begin();
			em.persist(item);
			em.getTransaction().commit();
		} catch (Exception e) {
			System.err.println(e);
		}finally {
			em.close();
		}
		return item;
	}
	
	public Item findById(Integer Id) {
		
		EntityManager em = new ConnectionFactory().getConnection();
		Item item = null;
		
		try {
			item = em.find(Item.class, Id);
		} catch (Exception e) {
			System.err.println(e);
		}finally {
			em.close();
		}
		return item;
	}
	
	public List<Item> findAll(){
		EntityManager em = new ConnectionFactory().getConnection();
		List<Item> items = null;
		try {
			items = em.createQuery("from Item p").getResultList();
		} catch (Exception e) {
			System.err.println(e);
		}finally{
			em.close();
		}
		return items;
	}
	
	public Item update(Item item) {
	    EntityManager em = new ConnectionFactory().getConnection();

	    try {
	        em.getTransaction().begin();
	        // Verifica se o usuário já existe no banco (se tiver um ID)
	        if (item.getId() > 0) {
	            // Atualiza o usuário existente no banco
	            item = em.merge(item);
	            em.getTransaction().commit();
	        }
	    } catch (Exception e) {
	        System.err.println(e);
	        em.getTransaction().rollback();
	    } finally {
	        em.close();
	    }
	    return item;
	}
	
	public Item remove(Integer Id) {
		
		EntityManager em = new ConnectionFactory().getConnection();
		Item item = null;
		try {
			item = em.find(Item.class, Id );
			em.getTransaction().begin();
			em.remove(item);
			em.getTransaction().commit();
		} catch (Exception e) {
			System.err.println(e);
			em.getTransaction().rollback();
		} finally {
			em.close();
		}
		return item;
	}
}
