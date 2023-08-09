SELECT * FROM patients

SELECT * FROM patients p 
Inner Join admissions a On a.patient_id=p.patient_id
Inner join province_names pr On pr.province_id=p.province_id
Inner join doctors d On d.doctor_id = a.attending_doctor_id
where p.patient_id<9

SELECT * FROM patients p 
left Join admissions a On a.patient_id=p.patient_id
left join province_names pr On pr.province_id=p.province_id
left join doctors d On d.doctor_id = a.attending_doctor_id
where p.patient_id<9
