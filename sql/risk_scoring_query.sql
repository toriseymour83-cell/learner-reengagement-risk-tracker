USE LearnerReengagementTracker;
GO

DROP VIEW IF EXISTS vw_learner_risk_scores;
GO

CREATE VIEW vw_learner_risk_scores AS

WITH scored_learners AS (

    SELECT
        l.learner_id,
        l.learner_name,
        l.provision_type,
        l.tutor,
        a.attendance_rate,
        e.last_work_submitted_days,
        e.last_contact_days,
        e.recent_positive_contact,
        e.previous_disengagement,

        (
            CASE
                WHEN a.attendance_rate < 50 THEN 5
                WHEN a.attendance_rate < 70 THEN 3
                WHEN a.attendance_rate < 80 THEN 1
                ELSE 0
            END
            +
            CASE
                WHEN e.last_work_submitted_days > 20 THEN 3
                WHEN e.last_work_submitted_days > 14 THEN 2
                WHEN e.last_work_submitted_days > 7 THEN 1
                ELSE 0
            END
            +
            CASE
                WHEN e.last_contact_days > 14 THEN 2
                WHEN e.last_contact_days > 7 THEN 1
                ELSE 0
            END
            +
            CASE
                WHEN e.previous_disengagement = 'Yes' THEN 2
                ELSE 0
            END
            +
            CASE
                WHEN e.recent_positive_contact = 'No' THEN 1
                ELSE 0
            END
        ) AS total_risk_score

    FROM learners_sample l

    LEFT JOIN attendance_sample a
        ON l.learner_id = a.learner_id

    LEFT JOIN engagement_sample e
        ON l.learner_id = e.learner_id
)

SELECT
    *,
    CASE
        WHEN total_risk_score >= 6 THEN 'High'
        WHEN total_risk_score >= 3 THEN 'Medium'
        ELSE 'Low'
    END AS risk_level

FROM scored_learners;
GO

SELECT *
FROM vw_learner_risk_scores;
