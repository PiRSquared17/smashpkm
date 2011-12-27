/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import controller.exceptions.NonexistentEntityException;
import controller.exceptions.PreexistingEntityException;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import model.Pengajuan;

/**
 *
 * @author yosua
 */
public class PengajuanJpaController {

    public PengajuanJpaController() {
        emf = Persistence.createEntityManagerFactory("SmashPU");
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

       public void create(Pengajuan pengajuan) throws PreexistingEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(pengajuan);
            em.getTransaction().commit();
        } catch (Exception ex) {
            if (findPengajuan(pengajuan.getIdpengajuan()) != null) {
                throw new PreexistingEntityException("Pengajuan " + pengajuan + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Pengajuan pengajuan) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            pengajuan = em.merge(pengajuan);
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                String id = pengajuan.getIdpengajuan();
                if (findPengajuan(id) == null) {
                    throw new NonexistentEntityException("The pengajuan with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(String id) throws NonexistentEntityException {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Pengajuan pengajuan;
            try {
                pengajuan = em.getReference(Pengajuan.class, id);
                pengajuan.getIdpengajuan();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The pengajuan with id " + id + " no longer exists.", enfe);
            }
            em.remove(pengajuan);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Pengajuan> findPengajuanEntities() {
        return findPengajuanEntities(true, -1, -1);
    }

    public List<Pengajuan> findPengajuanEntities(int maxResults, int firstResult) {
        return findPengajuanEntities(false, maxResults, firstResult);
    }

    private List<Pengajuan> findPengajuanEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Pengajuan.class));
            Query q = em.createQuery(cq);
            if (!all) {
                q.setMaxResults(maxResults);
                q.setFirstResult(firstResult);
            }
            return q.getResultList();
        } finally {
            em.close();
        }
    }

    public Pengajuan findPengajuan(String id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Pengajuan.class, id);
        } finally {
            em.close();
        }
    }

    public int getPengajuanCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Pengajuan> rt = cq.from(Pengajuan.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }

    public List<Pengajuan> getAllPengajuanByNrp(String nrp) {

        List<Pengajuan> pengajuan = new ArrayList<Pengajuan>();
        EntityManager em = getEntityManager();
        try {
            Query q = em.createQuery("SELECT o FROM Pengajuan o WHERE o.nrp.nrp=:nrp");
            q.setParameter("nrp", nrp);
            pengajuan = q.getResultList();

        } finally {
            if (em != null) {
                em.close();
            }
        }
        return pengajuan;
    }

}