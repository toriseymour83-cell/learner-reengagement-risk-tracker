
# Data Dictionary

This document describes the fields used in the sample learner re-engagement dataset.

## Learner fields

| Field name | Description | Example |
|---|---|---|
| learner_id | Unique learner reference | L001 |
| learner_name | Sample learner name | Alex Morgan |
| age | Learner age | 16 |
| provision_type | Type of provision | EOTAS |
| send_status | Whether SEND support is recorded | Yes |
| ehcp_status | Whether the learner has an EHCP | Yes |
| primary_barrier | Main recorded barrier to engagement | Anxiety |
| tutor | Assigned tutor or mentor | J. Patel |

## Attendance fields

| Field name | Description | Example |
|---|---|---|
| sessions_expected | Number of sessions the learner was expected to attend | 20 |
| sessions_attended | Number of sessions attended | 14 |
| attendance_rate | Percentage of expected sessions attended | 70% |
| missed_sessions | Number of missed sessions | 6 |

## Engagement fields

| Field name | Description | Example |
|---|---|---|
| last_work_submitted_days | Number of days since work was last submitted | 12 |
| last_contact_days | Number of days since tutor/support contact | 5 |
| recent_positive_contact | Whether recent positive contact has been recorded | Yes |
| previous_disengagement | Whether previous disengagement concerns have been recorded | No |

## Risk fields

| Field name | Description | Example |
|---|---|---|
| risk_score | Points-based score calculated from engagement indicators | 5 |
| risk_level | Low, Medium or High | Medium |
| suggested_action | Suggested supportive next step | Tutor check-in |
