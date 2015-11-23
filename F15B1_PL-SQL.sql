-- Page 2: Request for Exception
-- RFE's By You
-- Source SQL Query
select distinct RFE_ID,
       EMP_NAME as REQUESTOR,
       LAB_CODE as LAB,
       RFE_STATUS as STATUS,
       h.EFFECTIVE_DATE as "Status Effective Date",
       APPROVAL_REVIEW_DATE
from F15B1_RFE r
  join F15B1_EMP e on r.F15B1_EMP_EMP_ID = e.EMP_ID
  join F15B1_LAB l on e.F15B1_LAB_LAB_ID = l.LAB_ID
  join F15B1_HIST h on h.F15B1_RFE_RFE_ID = r.RFE_ID
  join F15B1_STATUS s on s.STATUS_ID = h.F15B1_STATUS_STATUS_ID
where RFE_STATUS in
(
  select rfe_status
    from F15B1_HIST h2
    join F15B1_STATUS s2 on h2.F15B1_STATUS_STATUS_ID = s2.STATUS_ID
  where h2.F15B1_RFE_RFE_ID = r.RFE_ID
  order by EFFECTIVE_DATE desc
  FETCH NEXT ROW ONLY
) and EFFECTIVE_DATE in
(
  select EFFECTIVE_DATE
    from F15B1_HIST h2
    join F15B1_STATUS s2 on h2.F15B1_STATUS_STATUS_ID = s2.STATUS_ID
  where h2.F15B1_RFE_RFE_ID = r.RFE_ID
  order by EFFECTIVE_DATE desc
  FETCH NEXT ROW ONLY
) and r.F15B1_EMP_EMP_ID = :P1_EMP
order by 1;

-- Lab System Admin TODO
-- Source SQL Query
select distinct RFE_ID,
       EMP_NAME as REQUESTOR,
       LAB_CODE as LAB,
       RFE_STATUS as STATUS,
       h.EFFECTIVE_DATE as "Status Effective Date",
       APPROVAL_REVIEW_DATE
from F15B1_RFE r
  join F15B1_EMP e on r.F15B1_EMP_EMP_ID = e.EMP_ID
  join F15B1_LAB l on e.F15B1_LAB_LAB_ID = l.LAB_ID
  join F15B1_HIST h on h.F15B1_RFE_RFE_ID = r.RFE_ID
  join F15B1_STATUS s on s.STATUS_ID = h.F15B1_STATUS_STATUS_ID
where RFE_STATUS in
(
  select rfe_status
    from F15B1_HIST h2
    join F15B1_STATUS s2 on h2.F15B1_STATUS_STATUS_ID = s2.STATUS_ID
  where h2.F15B1_RFE_RFE_ID = r.RFE_ID
    and rfe_status = 'Submitted'
  order by EFFECTIVE_DATE desc
  FETCH NEXT ROW ONLY
) and EFFECTIVE_DATE in
(
  select EFFECTIVE_DATE
    from F15B1_HIST h2
    join F15B1_STATUS s2 on h2.F15B1_STATUS_STATUS_ID = s2.STATUS_ID
  where h2.F15B1_RFE_RFE_ID = r.RFE_ID
  order by EFFECTIVE_DATE desc
  FETCH NEXT ROW ONLY
) and e.F15B1_LAB_LAB_ID = :P1_LAB
order by 1;

-- Condition SQL Query
select EMP_ID
from F15B1_EMP
where F15B1_LAB_LAB_ID = :P1_LAB and EMP_ID = :P1_EMP and
      (SYSTEM_ADMIN_FLAG = 'Y');

-- Lab Director TODO
-- Source SQL Query
select distinct RFE_ID,
       EMP_NAME as REQUESTOR,
       LAB_CODE as LAB,
       RFE_STATUS as STATUS,
       h.EFFECTIVE_DATE as "Status Effective Date",
       APPROVAL_REVIEW_DATE
from F15B1_RFE r
  join F15B1_EMP e on r.F15B1_EMP_EMP_ID = e.EMP_ID
  join F15B1_LAB l on e.F15B1_LAB_LAB_ID = l.LAB_ID
  join F15B1_HIST h on h.F15B1_RFE_RFE_ID = r.RFE_ID
  join F15B1_STATUS s on s.STATUS_ID = h.F15B1_STATUS_STATUS_ID
where RFE_STATUS in
(
  select rfe_status
    from F15B1_HIST h2
    join F15B1_STATUS s2 on h2.F15B1_STATUS_STATUS_ID = s2.STATUS_ID
  where h2.F15B1_RFE_RFE_ID = r.RFE_ID
    and rfe_status = 'SA Approved'
  order by EFFECTIVE_DATE desc
  FETCH NEXT ROW ONLY
) and EFFECTIVE_DATE in
(
  select EFFECTIVE_DATE
    from F15B1_HIST h2
    join F15B1_STATUS s2 on h2.F15B1_STATUS_STATUS_ID = s2.STATUS_ID
  where h2.F15B1_RFE_RFE_ID = r.RFE_ID
  order by EFFECTIVE_DATE desc
  FETCH NEXT ROW ONLY
)
and e.F15B1_LAB_LAB_ID = :P1_LAB
order by 1;

-- Condition SQL Query
select EMP_ID
from F15B1_EMP
where F15B1_LAB_LAB_ID = :P1_LAB and EMP_ID = :P1_EMP and
      (LAB_DIRECTOR_FLAG = 'Y');

-- Chairperson TODO
-- Source SQL Query
select distinct RFE_ID,
       EMP_NAME as REQUESTOR,
       LAB_CODE as LAB,
       RFE_STATUS as STATUS,
       h.EFFECTIVE_DATE as "Status Effective Date",
       APPROVAL_REVIEW_DATE
from F15B1_RFE r
  join F15B1_EMP e on r.F15B1_EMP_EMP_ID = e.EMP_ID
  join F15B1_LAB l on e.F15B1_LAB_LAB_ID = l.LAB_ID
  join F15B1_HIST h on h.F15B1_RFE_RFE_ID = r.RFE_ID
  join F15B1_STATUS s on s.STATUS_ID = h.F15B1_STATUS_STATUS_ID
where RFE_STATUS in
(
  select rfe_status
    from F15B1_HIST h2
    join F15B1_STATUS s2 on h2.F15B1_STATUS_STATUS_ID = s2.STATUS_ID
  where h2.F15B1_RFE_RFE_ID = r.RFE_ID
    and rfe_status = 'LD Approval'
  order by EFFECTIVE_DATE desc
  FETCH NEXT ROW ONLY
) and EFFECTIVE_DATE in
(
  select EFFECTIVE_DATE
    from F15B1_HIST h2
    join F15B1_STATUS s2 on h2.F15B1_STATUS_STATUS_ID = s2.STATUS_ID
  where h2.F15B1_RFE_RFE_ID = r.RFE_ID
  order by EFFECTIVE_DATE desc
  FETCH NEXT ROW ONLY
)
order by 1;

-- Condition SQL Query
select EMP_ID
from F15B1_EMP
where  EMP_ID = :P1_EMP and
      CHAIRPERSON_FLAG = 'Y';

-- Executive Director TODO
-- Source SQL Query
select distinct RFE_ID,
       EMP_NAME as REQUESTOR,
       LAB_CODE as LAB,
       RFE_STATUS as STATUS,
       h.EFFECTIVE_DATE as "Status Effective Date",
       APPROVAL_REVIEW_DATE
from F15B1_RFE r
  join F15B1_EMP e on r.F15B1_EMP_EMP_ID = e.EMP_ID
  join F15B1_LAB l on e.F15B1_LAB_LAB_ID = l.LAB_ID
  join F15B1_HIST h on h.F15B1_RFE_RFE_ID = r.RFE_ID
  join F15B1_STATUS s on s.STATUS_ID = h.F15B1_STATUS_STATUS_ID
where RFE_STATUS in
(
  select rfe_status
    from F15B1_HIST h2
    join F15B1_STATUS s2 on h2.F15B1_STATUS_STATUS_ID = s2.STATUS_ID
  where h2.F15B1_RFE_RFE_ID = r.RFE_ID
    and rfe_status = 'CH Approval'
  order by EFFECTIVE_DATE desc
  FETCH NEXT ROW ONLY
) and EFFECTIVE_DATE in
(
  select EFFECTIVE_DATE
    from F15B1_HIST h2
    join F15B1_STATUS s2 on h2.F15B1_STATUS_STATUS_ID = s2.STATUS_ID
  where h2.F15B1_RFE_RFE_ID = r.RFE_ID
  order by EFFECTIVE_DATE desc
  FETCH NEXT ROW ONLY
)
order by 1;

-- Condition SQL Query
select EMP_ID
from F15B1_EMP
where  EMP_ID = :P1_EMP and
      EXEC_DIRECTOR_FLAG = 'Y';

-- RFE's in Your Lab
-- Source SQL Query
select distinct RFE_ID,
       EMP_NAME as REQUESTOR,
       LAB_CODE as LAB,
       RFE_STATUS as STATUS,
       h.EFFECTIVE_DATE as "Status Effective Date",
       APPROVAL_REVIEW_DATE
from F15B1_RFE r
  join F15B1_EMP e on r.F15B1_EMP_EMP_ID = e.EMP_ID
  join F15B1_LAB l on e.F15B1_LAB_LAB_ID = l.LAB_ID
  join F15B1_HIST h on h.F15B1_RFE_RFE_ID = r.RFE_ID
  join F15B1_STATUS s on s.STATUS_ID = h.F15B1_STATUS_STATUS_ID
where RFE_STATUS in
(
  select rfe_status
    from F15B1_HIST h2
    join F15B1_STATUS s2 on h2.F15B1_STATUS_STATUS_ID = s2.STATUS_ID
  where h2.F15B1_RFE_RFE_ID = r.RFE_ID
  order by EFFECTIVE_DATE desc
  FETCH NEXT ROW ONLY
) and EFFECTIVE_DATE in
(
  select EFFECTIVE_DATE
    from F15B1_HIST h2
    join F15B1_STATUS s2 on h2.F15B1_STATUS_STATUS_ID = s2.STATUS_ID
  where h2.F15B1_RFE_RFE_ID = r.RFE_ID
  order by EFFECTIVE_DATE desc
  FETCH NEXT ROW ONLY
)
and e.F15B1_LAB_LAB_ID = :P1_LAB
order by 1;

-- Condition SQL Query
select EMP_ID
from F15B1_EMP
where F15B1_LAB_LAB_ID = :P1_LAB and EMP_ID = :P1_EMP and
      (SYSTEM_ADMIN_FLAG = 'Y' or
      LAB_DIRECTOR_FLAG = 'Y');

-- RFE's FYI Review
-- Source Query
select distinct RFE_ID,
       EMP_NAME as REQUESTOR,
       LAB_CODE as LAB,
       RFE_STATUS as STATUS,
       h.EFFECTIVE_DATE as "Status Effective Date",
       APPROVAL_REVIEW_DATE
from F15B1_RFE r
  join F15B1_EMP e on r.F15B1_EMP_EMP_ID = e.EMP_ID
  join F15B1_LAB l on e.F15B1_LAB_LAB_ID = l.LAB_ID
  join F15B1_HIST h on h.F15B1_RFE_RFE_ID = r.RFE_ID
  join F15B1_STATUS s on s.STATUS_ID = h.F15B1_STATUS_STATUS_ID
  join F15B1_CONTACT c on c.F15B1_RFE_RFE_ID = r.RFE_ID
where RFE_STATUS in
(
  select rfe_status
    from F15B1_HIST h2
    join F15B1_STATUS s2 on h2.F15B1_STATUS_STATUS_ID = s2.STATUS_ID
  where h2.F15B1_RFE_RFE_ID = r.RFE_ID
  order by EFFECTIVE_DATE desc
  FETCH NEXT ROW ONLY
) and h.EFFECTIVE_DATE in
(
  select EFFECTIVE_DATE
    from F15B1_HIST h2
    join F15B1_STATUS s2 on h2.F15B1_STATUS_STATUS_ID = s2.STATUS_ID
  where h2.F15B1_RFE_RFE_ID = r.RFE_ID
  order by EFFECTIVE_DATE desc
  FETCH NEXT ROW ONLY
) and c.F15B1_EMP_EMP_ID = :P1_EMP
order by 1;

-- Condition SQL Query
select CONTACT_ID
from F15B1_CONTACT
where F15B1_EMP_EMP_ID = :P1_EMP;

-- All RFE's
-- Source SQL Query
select distinct RFE_ID,
       EMP_NAME as REQUESTOR,
       LAB_CODE as LAB,
       RFE_STATUS as STATUS,
       h.EFFECTIVE_DATE as "Status Effective Date",
       APPROVAL_REVIEW_DATE
from F15B1_RFE r
  join F15B1_EMP e on r.F15B1_EMP_EMP_ID = e.EMP_ID
  join F15B1_LAB l on e.F15B1_LAB_LAB_ID = l.LAB_ID
  join F15B1_HIST h on h.F15B1_RFE_RFE_ID = r.RFE_ID
  join F15B1_STATUS s on s.STATUS_ID = h.F15B1_STATUS_STATUS_ID
where RFE_STATUS in
(
  select rfe_status
    from F15B1_HIST h2
    join F15B1_STATUS s2 on h2.F15B1_STATUS_STATUS_ID = s2.STATUS_ID
  where h2.F15B1_RFE_RFE_ID = r.RFE_ID
  order by EFFECTIVE_DATE desc
  FETCH NEXT ROW ONLY
) and EFFECTIVE_DATE in
(
  select EFFECTIVE_DATE
    from F15B1_HIST h2
    join F15B1_STATUS s2 on h2.F15B1_STATUS_STATUS_ID = s2.STATUS_ID
  where h2.F15B1_RFE_RFE_ID = r.RFE_ID
  order by EFFECTIVE_DATE desc
  FETCH NEXT ROW ONLY
)
order by 1;

-- Condition SQL Query
select F15B1_AUTH_AUTH_ID
from F15B1_EMP
where EMP_ID = :P1_EMP
and F15B1_AUTH_AUTH_ID <> 2;

-- Condition SQL Query
select F15B1_AUTH_AUTH_ID
from F15B1_EMP
where EMP_ID = :P1_EMP
and (F15B1_AUTH_AUTH_ID <> 1 or F15B1_AUTH_AUTH_ID is null);

-- To Expire
select distinct RFE_ID,
       EMP_NAME as REQUESTOR,
       LAB_CODE as LAB,
       RFE_STATUS as STATUS,
       h.EFFECTIVE_DATE as "Status Effective Date",
       APPROVAL_REVIEW_DATE
from F15B1_RFE r
  join F15B1_EMP e on r.F15B1_EMP_EMP_ID = e.EMP_ID
  join F15B1_LAB l on e.F15B1_LAB_LAB_ID = l.LAB_ID
  join F15B1_HIST h on h.F15B1_RFE_RFE_ID = r.RFE_ID
  join F15B1_STATUS s on s.STATUS_ID = h.F15B1_STATUS_STATUS_ID
where RFE_STATUS in
(
  select rfe_status
    from F15B1_HIST h2
    join F15B1_STATUS s2 on h2.F15B1_STATUS_STATUS_ID = s2.STATUS_ID
  where h2.F15B1_RFE_RFE_ID = r.RFE_ID
  order by EFFECTIVE_DATE desc
  FETCH NEXT ROW ONLY
) and
EFFECTIVE_DATE in
(
  select EFFECTIVE_DATE
    from F15B1_HIST h2
    join F15B1_STATUS s2 on h2.F15B1_STATUS_STATUS_ID = s2.STATUS_ID
  where h2.F15B1_RFE_RFE_ID = r.RFE_ID
  order by EFFECTIVE_DATE desc
  FETCH NEXT ROW ONLY
)
and (APPROVAL_REVIEW_DATE - 35) <= SYSDATE and APPROVAL_REVIEW_DATE > SYSDATE
order by 1;

-- Just Expired
select distinct RFE_ID,
       EMP_NAME as REQUESTOR,
       LAB_CODE as LAB,
       RFE_STATUS as STATUS,
       h.EFFECTIVE_DATE as "Status Effective Date",
       APPROVAL_REVIEW_DATE
from F15B1_RFE r
  join F15B1_EMP e on r.F15B1_EMP_EMP_ID = e.EMP_ID
  join F15B1_LAB l on e.F15B1_LAB_LAB_ID = l.LAB_ID
  join F15B1_HIST h on h.F15B1_RFE_RFE_ID = r.RFE_ID
  join F15B1_STATUS s on s.STATUS_ID = h.F15B1_STATUS_STATUS_ID
where RFE_STATUS in
(
  select rfe_status
    from F15B1_HIST h2
    join F15B1_STATUS s2 on h2.F15B1_STATUS_STATUS_ID = s2.STATUS_ID
  where h2.F15B1_RFE_RFE_ID = r.RFE_ID
  order by EFFECTIVE_DATE desc
  FETCH NEXT ROW ONLY
) and EFFECTIVE_DATE in
(
  select EFFECTIVE_DATE
    from F15B1_HIST h2
    join F15B1_STATUS s2 on h2.F15B1_STATUS_STATUS_ID = s2.STATUS_ID
  where h2.F15B1_RFE_RFE_ID = r.RFE_ID
  order by EFFECTIVE_DATE desc
  FETCH NEXT ROW ONLY
)
and (APPROVAL_REVIEW_DATE + 35) >= SYSDATE and APPROVAL_REVIEW_DATE < SYSDATE
order by 1;

-- Page 4: Request for Exception Form
-- Default PL/SQL Function Body
DECLARE
 EMP_NAME_V VARCHAR(30);
BEGIN

  SELECT EMP_NAME
  INTO EMP_NAME_V
  FROM F15B1_EMP
  WHERE EMP_ID = :P1_EMP;

  RETURN EMP_NAME_V;

END;

-- Employee Display Name
DECLARE
 EMP_NAME_V VARCHAR(30);
BEGIN

  SELECT EMP_NAME
  INTO EMP_NAME_V
  FROM F15B1_EMP
  WHERE EMP_ID = :P1_EMP;

  RETURN EMP_NAME_V;

END;

-- Page 5: RFE Detail (RFE Detail View Only/Edit Only are similar)
-- Buttons
-- Duplicate
-- Dynamic Action PL/SQL
BEGIN
INSERT INTO F15B1_RFE (EXPLANATION, ALT_PROTECTIONS, APPROVAL_REVIEW_DATE, F15B1_EMP_EMP_ID)
VALUES ((select EXPLANATION from F15B1_RFE where RFE_ID = :P5_RFE_ID),
       (select ALT_PROTECTIONS from F15B1_RFE where RFE_ID = :P5_RFE_ID),
       (select APPROVAL_REVIEW_DATE from F15B1_RFE where RFE_ID = :P5_RFE_ID),
       (select F15B1_EMP_EMP_ID from F15B1_RFE where RFE_ID = :P5_RFE_ID));
END;

-- Recall
-- Condition SQL Query
select rfe_status as STATUS
  from F15B1_HIST h
  join F15B1_STATUS s on F15B1_STATUS_STATUS_ID = STATUS_ID
  join F15B1_RFE r on r.RFE_ID = h.F15B1_RFE_RFE_ID
where F15B1_RFE_RFE_ID = :P5_RFE_ID
and :P1_EMP = r.F15B1_EMP_EMP_ID
and
(rfe_status <> 'Final Approved' and rfe_status <> 'Recalled' and rfe_status <> 'Rejected' and rfe_status <> 'Entered' and rfe_status <> 'Returned')
and rfe_status in
(
    select rfe_status
      from F15B1_HIST
      join F15B1_STATUS on F15B1_STATUS_STATUS_ID = STATUS_ID
    where F15B1_RFE_RFE_ID = :P5_RFE_ID
    order by EFFECTIVE_DATE desc
    FETCH NEXT ROW ONLY)
order by EFFECTIVE_DATE desc
FETCH NEXT ROW ONLY;

-- Dynamic Action PL/SQL
begin
insert into F15B1_HIST
(EFFECTIVE_DATE, F15B1_RFE_RFE_ID, F15B1_STATUS_STATUS_ID, F15B1_EMP_EMP_ID)
select sysdate, RFE.RFE_ID, STATUS_ID, :P1_EMP
from dual, F15B1_STATUS, F15B1_RFE RFE
where RFE.RFE_ID = :P5_RFE_ID
and RFE_STATUS = 'Recalled';
end;

-- Return
-- Condition SQL Query
select rfe_status as STATUS
  from F15B1_HIST h
  join F15B1_STATUS s on F15B1_STATUS_STATUS_ID = STATUS_ID
  join F15B1_RFE r on r.RFE_ID = h.F15B1_RFE_RFE_ID
  , F15B1_EMP
  where F15B1_RFE_RFE_ID = :P5_RFE_ID
and :P1_EMP <> r.F15B1_EMP_EMP_ID
and
(rfe_status <> 'Final Approved' and rfe_status <> 'Recalled' and rfe_status <> 'Entered' and rfe_status <> 'Returned' and rfe_status <> 'Rejected')
and rfe_status in
(
    select rfe_status
      from F15B1_HIST
      join F15B1_STATUS on F15B1_STATUS_STATUS_ID = STATUS_ID
    where F15B1_RFE_RFE_ID = :P5_RFE_ID
    order by EFFECTIVE_DATE desc
    FETCH NEXT ROW ONLY)
and (CHAIRPERSON_FLAG = 'Y' or EXEC_DIRECTOR_FLAG = 'Y' or SYSTEM_ADMIN_FLAG = 'Y' or LAB_DIRECTOR_FLAG = 'Y')
order by EFFECTIVE_DATE desc
FETCH NEXT ROW ONLY;

-- Dynamic Action PL/SQL
begin
insert into F15B1_HIST
(EFFECTIVE_DATE, F15B1_RFE_RFE_ID, F15B1_STATUS_STATUS_ID, F15B1_EMP_EMP_ID)
select sysdate, RFE.RFE_ID, STATUS_ID, :P1_EMP
from dual, F15B1_STATUS, F15B1_RFE RFE
where RFE.RFE_ID = :P5_RFE_ID
and RFE_STATUS = 'Returned';
end;

-- Submit
-- Condition SQL Query
select rfe_status as STATUS,
       effective_date,
       emp_name
  from F15B1_HIST
  join F15B1_STATUS on F15B1_STATUS_STATUS_ID = STATUS_ID
  join F15B1_EMP on F15B1_EMP_EMP_ID = EMP_ID
where F15B1_RFE_RFE_ID = :P5_RFE_ID
and (rfe_status = 'Entered' or rfe_status = 'Recalled' or rfe_status = 'Returned')
and rfe_status in
(
    select rfe_status
      from F15B1_HIST
      join F15B1_STATUS on F15B1_STATUS_STATUS_ID = STATUS_ID
    where F15B1_RFE_RFE_ID = :P5_RFE_ID
    order by EFFECTIVE_DATE desc
    FETCH NEXT ROW ONLY)
order by EFFECTIVE_DATE desc
FETCH NEXT ROW ONLY;

-- Dynamic Action PL/SQL
begin
insert into F15B1_HIST
(EFFECTIVE_DATE, F15B1_RFE_RFE_ID, F15B1_STATUS_STATUS_ID, F15B1_EMP_EMP_ID)
select sysdate, RFE.RFE_ID, STATUS_ID, :P1_EMP
from dual, F15B1_STATUS, F15B1_RFE RFE
where RFE.RFE_ID = :P5_RFE_ID
and RFE_STATUS = 'Submitted';
end;

-- SA Approve
-- Condition SQL Query
select rfe_status as STATUS
  from F15B1_HIST h
  join F15B1_STATUS s on F15B1_STATUS_STATUS_ID = STATUS_ID
  join F15B1_RFE r on r.RFE_ID = h.F15B1_RFE_RFE_ID
  , F15B1_EMP
where F15B1_RFE_RFE_ID = :P5_RFE_ID
and
(rfe_status = 'Submitted')
and rfe_status in
(
    select rfe_status
      from F15B1_HIST
      join F15B1_STATUS on F15B1_STATUS_STATUS_ID = STATUS_ID
    where F15B1_RFE_RFE_ID = :P5_RFE_ID
    order by EFFECTIVE_DATE desc
    FETCH NEXT ROW ONLY)
and (F15B1_LAB_LAB_ID = :P1_LAB
and EMP_ID = :P1_EMP
and (SYSTEM_ADMIN_FLAG = 'Y'))
order by EFFECTIVE_DATE desc
FETCH NEXT ROW ONLY;

-- Dynamic Action PL/SQL
begin
insert into F15B1_HIST
(EFFECTIVE_DATE, F15B1_RFE_RFE_ID, F15B1_STATUS_STATUS_ID, F15B1_EMP_EMP_ID)
select sysdate, RFE.RFE_ID, STATUS_ID, :P1_EMP
from dual, F15B1_STATUS, F15B1_RFE RFE
where RFE.RFE_ID = :P5_RFE_ID
and RFE_STATUS = 'SA Approved';
end;

-- LD Approve
-- Condition SQL Query
select rfe_status as STATUS
  from F15B1_HIST h
  join F15B1_STATUS s on F15B1_STATUS_STATUS_ID = STATUS_ID
  join F15B1_RFE r on r.RFE_ID = h.F15B1_RFE_RFE_ID
  , F15B1_EMP
where F15B1_RFE_RFE_ID = :P5_RFE_ID
and
(rfe_status = 'SA Approved')
and rfe_status in
(
    select rfe_status
      from F15B1_HIST
      join F15B1_STATUS on F15B1_STATUS_STATUS_ID = STATUS_ID
    where F15B1_RFE_RFE_ID = :P5_RFE_ID
    order by EFFECTIVE_DATE desc
    FETCH NEXT ROW ONLY)
and (F15B1_LAB_LAB_ID = :P1_LAB
and EMP_ID = :P1_EMP
and (LAB_DIRECTOR_FLAG = 'Y'))
order by EFFECTIVE_DATE desc
FETCH NEXT ROW ONLY;

-- Dynamic Action PL/SQL Query
begin
insert into F15B1_HIST
(EFFECTIVE_DATE, F15B1_RFE_RFE_ID, F15B1_STATUS_STATUS_ID, F15B1_EMP_EMP_ID)
select sysdate, RFE.RFE_ID, STATUS_ID, :P1_EMP
from dual, F15B1_STATUS, F15B1_RFE RFE
where RFE.RFE_ID = :P5_RFE_ID
and RFE_STATUS = 'LD Approval';
end;

-- CH Approve
-- Condition SQL Query
select rfe_status as STATUS
  from F15B1_HIST h
  join F15B1_STATUS s on F15B1_STATUS_STATUS_ID = STATUS_ID
  join F15B1_RFE r on r.RFE_ID = h.F15B1_RFE_RFE_ID
  , F15B1_EMP
where F15B1_RFE_RFE_ID = :P5_RFE_ID
and
(rfe_status = 'LD Approval')
and rfe_status in
(
    select rfe_status
      from F15B1_HIST
      join F15B1_STATUS on F15B1_STATUS_STATUS_ID = STATUS_ID
    where F15B1_RFE_RFE_ID = :P5_RFE_ID
    order by EFFECTIVE_DATE desc
    FETCH NEXT ROW ONLY)
and (EMP_ID = :P1_EMP
and (CHAIRPERSON_FLAG = 'Y'))
order by EFFECTIVE_DATE desc
FETCH NEXT ROW ONLY;

-- Dynamic Action PL/SQL
begin
insert into F15B1_HIST
(EFFECTIVE_DATE, F15B1_RFE_RFE_ID, F15B1_STATUS_STATUS_ID, F15B1_EMP_EMP_ID)
select sysdate, RFE.RFE_ID, STATUS_ID, :P1_EMP
from dual, F15B1_STATUS, F15B1_RFE RFE
where RFE.RFE_ID = :P5_RFE_ID
and RFE_STATUS = 'CH Approval';
end;

-- ED Approve
-- Condition SQL Query
select rfe_status as STATUS
  from F15B1_HIST h
  join F15B1_STATUS s on F15B1_STATUS_STATUS_ID = STATUS_ID
  join F15B1_RFE r on r.RFE_ID = h.F15B1_RFE_RFE_ID
  , F15B1_EMP
where F15B1_RFE_RFE_ID = :P5_RFE_ID
and
(rfe_status = 'CH Approval')
and rfe_status in
(
    select rfe_status
      from F15B1_HIST
      join F15B1_STATUS on F15B1_STATUS_STATUS_ID = STATUS_ID
    where F15B1_RFE_RFE_ID = :P5_RFE_ID
    order by EFFECTIVE_DATE desc
    FETCH NEXT ROW ONLY)
and (EMP_ID = :P1_EMP
and (EXEC_DIRECTOR_FLAG = 'Y'))
order by EFFECTIVE_DATE desc
FETCH NEXT ROW ONLY;

-- Dynamic Action PL/SQL
begin
insert into F15B1_HIST
(EFFECTIVE_DATE, F15B1_RFE_RFE_ID, F15B1_STATUS_STATUS_ID, F15B1_EMP_EMP_ID)
select sysdate, RFE.RFE_ID, STATUS_ID, :P1_EMP
from dual, F15B1_STATUS, F15B1_RFE RFE
where RFE.RFE_ID = :P5_RFE_ID
and RFE_STATUS = 'Final Approved';
end;

-- Reject
-- Condition SQL Query
select rfe_status as STATUS
  from F15B1_HIST h
  join F15B1_STATUS s on F15B1_STATUS_STATUS_ID = STATUS_ID
  join F15B1_RFE r on r.RFE_ID = h.F15B1_RFE_RFE_ID
  , F15B1_EMP
  where F15B1_RFE_RFE_ID = :P5_RFE_ID
and :P1_EMP <> r.F15B1_EMP_EMP_ID
and
(rfe_status <> 'Final Approved' and rfe_status <> 'Recalled' and rfe_status <> 'Entered' and rfe_status <> 'Returned' and rfe_status <> 'Rejected')
and rfe_status in
(
    select rfe_status
      from F15B1_HIST
      join F15B1_STATUS on F15B1_STATUS_STATUS_ID = STATUS_ID
    where F15B1_RFE_RFE_ID = :P5_RFE_ID
    order by EFFECTIVE_DATE desc
    FETCH NEXT ROW ONLY)
and (CHAIRPERSON_FLAG = 'Y' or EXEC_DIRECTOR_FLAG = 'Y' or SYSTEM_ADMIN_FLAG = 'Y' or LAB_DIRECTOR_FLAG = 'Y')
order by EFFECTIVE_DATE desc
FETCH NEXT ROW ONLY;

-- Dynamic Action PL/SQL
begin
insert into F15B1_HIST
(EFFECTIVE_DATE, F15B1_RFE_RFE_ID, F15B1_STATUS_STATUS_ID, F15B1_EMP_EMP_ID)
select sysdate, RFE.RFE_ID, STATUS_ID, RFE.F15B1_EMP_EMP_ID
from dual, F15B1_STATUS, F15B1_RFE RFE
where RFE.RFE_ID = :P5_RFE_ID
and RFE_STATUS = 'Rejected';
end;

-- Requestor
-- Source
select EMP_NAME as Requestor
 from F15B1_RFE F15B1_RFE
  join F15B1_EMP on EMP_ID = F15B1_EMP_EMP_ID
 where RFE_ID = :P0_RFE_ID;

select LAB_CODE as LAB
 from F15B1_RFE
  join F15B1_EMP on EMP_ID = F15B1_EMP_EMP_ID
  join F15B1_LAB on F15B1_LAB_LAB_ID = LAB_ID
 where RFE_ID = :P0_RFE_ID;

 select EMP_EMAIL as EMAIL
 from F15B1_RFE
  join F15B1_EMP on EMP_ID = F15B1_EMP_EMP_ID
 where RFE_ID = :P0_RFE_ID;

 select EMP_OFFICE as OFFICE
 from F15B1_RFE
  join F15B1_EMP on EMP_ID = F15B1_EMP_EMP_ID
 where RFE_ID = :P0_RFE_ID;

 select EMP_PHONE as PHONE
 from F15B1_RFE
  join F15B1_EMP on EMP_ID = F15B1_EMP_EMP_ID
 where RFE_ID = :P0_RFE_ID;

-- Request for Exception
-- Condition
select EMP_ID
 from F15B1_STATUS F15B1_STATUS,
    F15B1_HIST F15B1_HIST,
    F15B1_EMP F15B1_EMP
 where F15B1_EMP.EMP_ID = F15B1_HIST.F15B1_EMP_EMP_ID
    and F15B1_HIST.F15B1_STATUS_STATUS_ID = F15B1_STATUS.STATUS_ID
    and (:P5_CUR_STATUS = 'Entered' or :P5_CUR_STATUS = 'Recalled')
union
select EMP_ID
    from F15B1_EMP
    where EMP_ID = :P1_EMP
    and F15B1_AUTH_AUTH_ID = 100;

-- Source
select F15B1_RFE.EXPLANATION as EXPLANATION
 from F15B1_RFE F15B1_RFE
where RFE_ID = :P0_RFE_ID;

select F15B1_RFE.ALT_PROTECTIONS as ALT_PROTECTIONS
 from F15B1_RFE F15B1_RFE
 where RFE_ID = :P0_RFE_ID;

select F15B1_RFE.APPROVAL_REVIEW_DATE as APPROVAL_REVIEW_DATE
 from F15B1_RFE F15B1_RFE
 where RFE_ID = :P0_RFE_ID;

-- Current Status
-- Source
select rfe_status,
       emp_name,
       effective_date
  from F15B1_HIST
  join F15B1_STATUS on F15B1_STATUS_STATUS_ID = STATUS_ID
  join F15B1_EMP on F15B1_EMP_EMP_ID = EMP_ID
where F15B1_RFE_RFE_ID = :P5_RFE_ID
order by EFFECTIVE_DATE desc
FETCH NEXT ROW ONLY;

-- Approvers
select
       ROLE_TYPE,
       EMP_NAME as NAME,
       LAB_CODE as LAB,
       EMP_EMAIL as EMAIL,
       EMP_OFFICE as OFFICE,
       EMP_PHONE as PHONE,
       EFFECTIVE_DATE
  from F15B1_APPROVER
    join F15B1_EMP on F15B1_EMP_EMP_ID = EMP_ID
    join F15B1_LAB on F15B1_LAB_LAB_ID = LAB_ID
    join F15B1_ROLE on F15B1_ROLE_ROLE_ID = ROLE_ID
  where F15B1_RFE_RFE_ID = :P5_RFE_ID
  order by ROLE_ID;

-- FYI Reviewers
-- Source
select "CONTACT_ID",
"ROLE_TYPE",
"EMP_NAME" as NAME,
"LAB_CODE" as LAB,
"EMP_EMAIL" as EMAIL,
"EMP_OFFICE" as OFFICE,
"EMP_PHONE" as PHONE,
"COMMENTS",
"EFFECTIVE_DATE"
from "#OWNER#"."F15B1_CONTACT"
  join F15B1_EMP on F15B1_EMP_EMP_ID = EMP_ID
  join F15B1_ROLE on F15B1_ROLE_ROLE_ID = ROLE_ID
  join F15B1_LAB on F15B1_LAB_LAB_ID = LAB_ID
where F15B1_ROLE_ROLE_ID = 2
  and F15B1_RFE_RFE_ID = :P5_RFE_ID
order by 1;

-- Button Condition
select rfe_status as STATUS
  from F15B1_HIST h
  join F15B1_STATUS s on F15B1_STATUS_STATUS_ID = STATUS_ID
  join F15B1_RFE r on r.RFE_ID = h.F15B1_RFE_RFE_ID
where F15B1_RFE_RFE_ID = :P5_RFE_ID
and :P1_EMP = r.F15B1_EMP_EMP_ID
and
(rfe_status = 'Entered' or rfe_status = 'Returned' or rfe_status = 'Recalled')
and rfe_status in
(
    select rfe_status
      from F15B1_HIST
      join F15B1_STATUS on F15B1_STATUS_STATUS_ID = STATUS_ID
    where F15B1_RFE_RFE_ID = :P5_RFE_ID
    order by EFFECTIVE_DATE desc
    FETCH NEXT ROW ONLY)
order by EFFECTIVE_DATE desc
FETCH NEXT ROW ONLY;

-- Tasks
-- Source
select "RFE_TASK_ID",
F15B1_TASK.TASK_ABBREVIATION as TASK_ABBREVIATION,
    F15B1_TASK.TASK_DESCRIPTION as TASK_DESCRIPTION,
F15B1_RFE_TASK.EFFECTIVE_DATE as EFFECTIVE_DATE
from F15B1_TASK F15B1_TASK
join F15B1_RFE_TASK F15B1_RFE_TASK
on F15B1_RFE_TASK.F15B1_TASK_TASK_ID  = TASK_ID
join F15B1_RFE F15B1_RFE
on F15B1_RFE.RFE_ID = F15B1_RFE_TASK.F15B1_RFE_RFE_ID
where F15B1_RFE_TASK.F15B1_RFE_RFE_ID = :P5_RFE_ID;

-- Button Condition
select EMP_ID
 from F15B1_STATUS F15B1_STATUS,
    F15B1_HIST F15B1_HIST,
    F15B1_EMP F15B1_EMP
 where F15B1_EMP.EMP_ID = F15B1_HIST.F15B1_EMP_EMP_ID
    and F15B1_HIST.F15B1_STATUS_STATUS_ID = F15B1_STATUS.STATUS_ID
    and (:P5_CUR_STATUS = 'Entered' or :P5_CUR_STATUS = 'Recalled')
union
select EMP_ID
    from F15B1_EMP
    where EMP_ID = :P1_EMP
    and F15B1_AUTH_AUTH_ID = 100;

-- Tracking Comments
-- Source
select "COMMENTS",
EMP_NAME as Name,
"COMMENT_ENTRY_DATE"
from "#OWNER#"."F15B1_COMMENT"
join F15B1_EMP on F15B1_EMP_EMP_ID = EMP_ID
where F15B1_RFE_RFE_ID = :P5_RFE_ID
order by comment_entry_date desc;

-- Documents
-- Source
select "DOC_ID",
"FILENAME",
"FILE_MIMETYPE",
"FILE_CHARSET",
dbms_lob.getlength("FILE_BLOB") "FILE_BLOB",
"FILE_COMMENTS",
"TAGS",
"F15B1_RFE_RFE_ID"
from "#OWNER#"."F15B1_DOC"
where F15B1_RFE_RFE_ID = :P5_RFE_ID;

-- Button Condition
select EMP_ID
 from F15B1_STATUS F15B1_STATUS,
    F15B1_HIST F15B1_HIST,
    F15B1_EMP F15B1_EMP
 where F15B1_EMP.EMP_ID = F15B1_HIST.F15B1_EMP_EMP_ID
    and F15B1_HIST.F15B1_STATUS_STATUS_ID = F15B1_STATUS.STATUS_ID
    and (:P5_CUR_STATUS = 'Entered' or :P5_CUR_STATUS = 'Recalled')
union
select EMP_ID
    from F15B1_EMP
    where EMP_ID = :P1_EMP
    and F15B1_AUTH_AUTH_ID = 100;

-- Page 6: Status History
-- Source
select rfe_status,
       effective_date,
       emp_name
  from F15B1_HIST
  join F15B1_STATUS on F15B1_STATUS_STATUS_ID = STATUS_ID
  join F15B1_EMP on F15B1_EMP_EMP_ID = EMP_ID
where F15B1_RFE_RFE_ID = :P5_RFE_ID
order by EFFECTIVE_DATE desc;

-- Page 30: Comment Form
DECLARE
 date_v DATE;
BEGIN

  SELECT SYSDATE
  INTO date_v
  FROM dual;

  RETURN date_v;

END;

-- Page 38: FYI Reviewer Form
Declare
  vrfe  NUMBER;
Begin
  select rfe_id
  into vrfe
  from F15B1_RFE
  where RFE_ID = :P5_RFE_ID;

  return vrfe;
End;

Declare
  vrole  NUMBER;
Begin
  select role_id
  into vrole
  from F15B1_ROLE
  where ROLE_TYPE = 'FYI Reviewer';

  return vrole;
End;

-- List of Values
-- Active Lab Employees
select emp_name as d,
       emp_id as r
  from F15B1_EMP
  where F15B1_LAB_LAB_ID = :P1_LAB and emp_status = 'A'
union
select emp_name as d,
       emp_id as r
  from F15B1_EMP
  where F15B1_LAB_LAB_ID is null and emp_status = 'A'
 order by 1;

-- Auth
select right as d,
       auth_id as r
  from F15B1_AUTH
 order by 1;

-- FYI Reviewers
select emp_name as d,
       emp_id as r
  from F15B1_EMP
  where SYSTEM_ADMIN_FLAG = 'N' and
       LAB_DIRECTOR_FLAG = 'N' and
       EXEC_DIRECTOR_FLAG = 'N' and
       CHAIRPERSON_FLAG = 'N' and
       emp_id <> :P1_EMP and
       emp_status <> 'I'
 order by 1;

-- Labs
select lab_code as d,
       lab_id as r
  from F15B1_LAB
 order by 1;

-- Tasks
select task_abbreviation as d,
       task_id as r
  from F15B1_TASK
 order by 1;


