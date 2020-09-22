package com.clientmonitor.entity;

import com.clientmonitor.enums.SessionType;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import java.sql.Timestamp;

@Entity
@Table(name ="sessions")
public class Session {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @ManyToOne(cascade= CascadeType.ALL)
    @JoinColumn(name="client_id")
    private Client client;

    @Enumerated(EnumType.STRING)
    @Column(name = "type")
    private SessionType type;

    @Column(name = "creation_time")
    private Timestamp creationTime;

    @Column(name = "duratation")
    private int duratation;

    @Column(name = "performance")
    private int performance;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name="diagnostic_id")
    private Diagnostic diagnostic;

    public int getId() {
        return id;
    }

    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }

    public SessionType getType() {
        return type;
    }

    public void setType(SessionType type) {
        this.type = type;
    }

    public Timestamp getCreationTime() {
        return creationTime;
    }

    public void setCreationTime(Timestamp creationTime) {
        this.creationTime = creationTime;
    }

    public int getDuratation() {
        return duratation;
    }

    public void setDuratation(int duratation) {
        this.duratation = duratation;
    }

    public int getPerformance() {
        return performance;
    }

    public void setPerformance(int performance) {
        this.performance = performance;
    }

    public Diagnostic getDiagnostic() {
        return diagnostic;
    }

    public void setDiagnostic(Diagnostic diagnostic) {
        this.diagnostic = diagnostic;
    }
}
