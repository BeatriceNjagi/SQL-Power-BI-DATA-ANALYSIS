-- Appointments enriched view

create view appointments_enriched as
select  
	a.appointmentid,
	a.patientid,
	a.doctorid,
	a.appointmentdate,
	concat(p.firstname, ' ', p.lastname) as patientname,
	concat(d.firstname, ' ', d.lastname) as doctorname
from appointments a
left join patients p
on a.patientid = p.patientid
left join doctors d
on d.doctorid = a.doctorid;

--Patient balances view

CREATE VIEW patient_balances AS
SELECT  
    p.patientid, 
    SUM(b.totalamount) AS totalbilled, 
    SUM(b.paidamount) AS totalpaid,
    SUM(b.totalamount) - SUM(b.paidamount) AS totaloutstanding
FROM patients p 
JOIN admissions a 
    ON p.patientid = a.patientid
JOIN bills b 
    ON a.admissionid = b.admissionid
GROUP BY p.patientid;


-- Doctor monthly metrics view
create view  doctor_monthly_metrics2 as;
select 
	a.appointmentdate,
	a.doctorid , 
	concat(d.firstname ,' ', d.lastname ) as doctorname,
	count(a.appointmentid) as totalappointments,
 	sum(case 
		when status = 'Cancelled' 
		then 1 else 0 end) as cancelledappointments,
		sum(case 
		when status = 'Cancelled' 
		then 1 else 0 end) * 100 / count(a.appointmentid) as cancellationrate	
from appointments a 
join doctors d 
on a.doctorid = d.doctorid 
group by a.appointmentdate  , a.doctorid, doctorname
order by a.appointmentdate desc; 




