
--select the patient details for doctor who treated the patient
select 
p.PatientId,
p.patientFirstName,
p.PatientDesies,
p.PatientEmail,
p.PatientDesies,
p.PatientAddress
from PatientTable p
Inner Join AppointmentsTable a
On p.PatientId=a.PatientId
where DoctorId=1

Create Procedure spGetMyPatients
@docId int
As
Begin
	Begin Try
		if @docId is null
			Break;
		Else
			Begin Transaction
				select 
				p.patientFirstName,
				p.patientLastName,
				p.PatientEmail,
				p.PatientPassword,
				p.PatientGender,
				p.PatientAddress,
				p.PatientCity,
				p.PatientState,
				p.PatientDesies
				from PatientTable p
				Inner Join AppointmentsTable a
				On p.PatientId=a.PatientId
				where DoctorId=@docId
			Commit Transaction
	End Try
	Begin Catch
	End Catch
End