	create table StrTest(PaymentDetails varchar(max))
insert into StrTest values ('Full Name = Abdullayev Shoxruh Account = 20201123456789790001 CorrAccount = 105USD777132005'),
              ('Full Name = Alimboev Hamid Account = 20001123459872543510 CorrAccount = 110USD000177007')


		select paymentdetails,substring(paymentdetails, datalength('Full Name = ')+1, 
		charindex('Account', paymentdetails) - datalength('Full Name = ') - 2) as FullName,
substring(paymentdetails, charindex('Account', paymentdetails) + datalength('Account = '), 
	charindex('CorrAccount', paymentdetails) - (charindex('Account', paymentdetails) + datalength('Account = '))- 1) as CardDetails,
substring(paymentdetails, charindex('Corraccount', paymentdetails) + datalength('Corraccount = '),
	datalength(paymentdetails) - (charindex('Corraccount', paymentdetails) + datalength('Corraccount = '))+1) as PaymentAmount
		from StrTest