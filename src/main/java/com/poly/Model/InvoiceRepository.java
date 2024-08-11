package com.poly.Model;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public class InvoiceRepository {

    @PersistenceContext
    private EntityManager entityManager;

    public List<Object[]> revenueByYear() {
        String hql = "SELECT YEAR(i.ngaylap), SUM(i.tongtien) FROM Invoice i GROUP BY YEAR(i.ngaylap) ORDER BY YEAR(i.ngaylap) DESC";
        TypedQuery<Object[]> query = entityManager.createQuery(hql, Object[].class);
        return query.getResultList();
    }
    
    public List<Object[]> revenueByMonth() {
        String hql = "SELECT MONTH (i.ngaylap), SUM(i.tongtien) FROM Invoice i GROUP BY MONTH (i.ngaylap) ORDER BY MONTH (i.ngaylap) DESC";
        TypedQuery<Object[]> query = entityManager.createQuery(hql, Object[].class);
        return query.getResultList();
    }
    
    public List<Object[]> revenueByQuarter() {
        String hql = "SELECT CEILING((MONTH (i.ngaylap)+1)/3), SUM(i.tongtien) FROM Invoice i GROUP BY CEILING((MONTH (i.ngaylap)+1)/3) ORDER BY CEILING((MONTH (i.ngaylap)+1)/3)";
        TypedQuery<Object[]> query = entityManager.createQuery(hql, Object[].class);
        return query.getResultList();
    }
}
