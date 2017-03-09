
select ACC.roll, ACC.name, ASSGN.question, ASSGN.problem_id, ASSGN.score, ASSGN.regrade_requested
from assignment as ASSGN, account as ACC
where
ASSGN.event_name='SPRING17_GL1' and
ASSGN.user_id = ACC.id and
ACC.type = 'STUDENT'

