package com.ms.ware.online.solution.entity;


import lombok.*;

import javax.persistence.*;
import java.util.Date;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
@Table(name = "booking")
public class Booking {

    @Id
    @Column(name = "bill_no", length = 15)
    private String billNo;
    @Column(name = "bill_sn", updatable = false)
    private Integer billSn;
    @Column(name = "fiscal_year", updatable = false)
    private Long fiscalYear;
    @Column(name = "branch", updatable = false)
    private Long branch;

    @Column(name = "book_date", updatable = false)
    @Temporal(TemporalType.DATE)
    private Date bookDate;


    @Column(name = "book_type", length = 10, updatable = false)
    private String bookType;


    @Column(name = "shipper_name", nullable = false)
    private String shipperName;
    @Column(name = "shipper_contact", nullable = false)
    private String shipperContact;
    @Column(name = "shipper_street")
    private String shipperStreet;
    @Column(name = "shipper_city", nullable = false)
    private String shipperCity;
    @Column(name = "shipper_country", nullable = false)
    private String shipperCountry;
    @Column(name = "consignee_name", nullable = false)
    private String consigneeName;
    @Column(name = "consignee_contact", nullable = false)
    private String consigneeContact;
    @Column(name = "consignee_street")
    private String consigneeStreet;
    @Column(name = "consignee_city", nullable = false)
    private String consigneeCity;
    @Column(name = "consignee_country", nullable = false)
    private String consigneeCountry;


}