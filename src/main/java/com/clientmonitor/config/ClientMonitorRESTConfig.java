package com.clientmonitor.config;

import com.clientmonitor.entity.Client;
import com.clientmonitor.entity.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.rest.core.config.RepositoryRestConfiguration;
import org.springframework.data.rest.webmvc.config.RepositoryRestConfigurer;
import org.springframework.http.HttpMethod;

import javax.persistence.EntityManager;
import javax.persistence.metamodel.EntityType;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@Configuration
public class ClientMonitorRESTConfig implements RepositoryRestConfigurer {

    @Autowired
    private EntityManager entityManager;

    @Override
    public void configureRepositoryRestConfiguration(RepositoryRestConfiguration config) {

        config.getExposureConfiguration()
                .forDomainType(Client.class)
                .withCollectionExposure(((metdata, httpMethods) -> httpMethods.disable(new HttpMethod[]{HttpMethod.DELETE, HttpMethod.PUT})))
                .withItemExposure(((metdata, httpMethods) -> httpMethods.disable(new HttpMethod[]{HttpMethod.PUT})));

        config.getExposureConfiguration()
                .forDomainType(Session.class)
                .withCollectionExposure(((metdata, httpMethods) -> httpMethods.disable(new HttpMethod[]{HttpMethod.DELETE, HttpMethod.PUT})))
                .withItemExposure(((metdata, httpMethods) -> httpMethods.disable(new HttpMethod[]{HttpMethod.PUT})))
                .withAssociationExposure(((metdata, httpMethods) -> httpMethods.disable(new HttpMethod[]{HttpMethod.DELETE, HttpMethod.PUT})));

        exposeIds(config);
    }

    private void exposeIds(RepositoryRestConfiguration config) {
        Set<EntityType<?>> entities = entityManager.getMetamodel().getEntities();

        List<Class> entityClasses = new ArrayList<>();

        for (EntityType tempEntityType : entities) {
            entityClasses.add(tempEntityType.getJavaType());
        }

        Class[] domainTypes = entityClasses.toArray(new Class[0]);
        config.exposeIdsFor(domainTypes);
    }
}
