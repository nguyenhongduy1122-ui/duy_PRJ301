/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javafx.scene.input.KeyCode;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;
import utils.DbUtils;
import utils.JPAUtils;

/**
 *
 * @author Duy
 */
public class UniversityDAO {

    public UniversityDAO() {
    }

    public UniversityDTO searchByID(String id) {
        EntityManager em = JPAUtils.getEntityManager();
        try {
            return em.find(UniversityDTO.class, id);
        } finally {
            em.close();
        }
    }

    public List<UniversityDTO> searchByName(String name) {
        EntityManager em = JPAUtils.getEntityManager();

        String jpql
                = "SELECT u FROM University u "
                + "WHERE u.status = true AND u.name LIKE :name";

        return em.createQuery(jpql, UniversityDTO.class)
                .setParameter("name", name)
                .getResultList();
    }

    public List<UniversityDTO> filterByName(String name) {
        name = "%" + name + "%";
        return searchByName(name);
    }

    public boolean softDelete(String id) {
        EntityManager em = JPAUtils.getEntityManager();
        EntityTransaction tx = em.getTransaction();

        try {
            tx.begin();

            //Delete
            UniversityDTO u = em.find(UniversityDTO.class, id);
            u.setStatus(false);
            //////////

            tx.commit();
            return true;

        } catch (Exception e) {
            tx.rollback();
            return false;
        } finally {
            em.close();
        }
    }

    public boolean add(UniversityDTO u) {
        EntityManager em = JPAUtils.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();

            // Add
            em.persist(u);
            /////////////

            tx.commit();
            return true;
        } catch (Exception e) {
            tx.rollback();
            return false;
        } finally {
            em.close();
        }
    }

    public boolean update(UniversityDTO u) {
        EntityManager em = JPAUtils.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            
            // UPDATE
            u.setStatus(true); // <--- THÊM DÒNG NÀY VÀO ĐÂY
            em.merge(u);
            /////////////

            tx.commit();
            return true;
        } catch (Exception e) {
            tx.rollback();
            return false;
        } finally {
            em.close();
        }
    }
}
