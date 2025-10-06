/*
##################
Title:            Dosing Weight Report
Summary           Retrieves retrives dosing weights entered. Filter by event start date & Time, DOB & specific MRNs.     
Date Created:     19/06/2025
Last Updated;     19/06/2025
Github link:      https://github.com/leoninformatics/Discern-Reporting/edit/main/Dosing_weight
Email:            lohagan@rotunda.ie
##################
*/

SELECT
      NAME = (P.NAME_FULL_FORMATTED)
    , MRN = (PA.ALIAS)
    , FIN = (EA.ALIAS)
    , DOB = (P.BIRTH_DT_TM) "DD/MM/YYYY"
    , DOSING_WEIGHT_DT_TM = C.EVENT_END_DT_TM "DD/MM/YYYY HH:MM"
    , DOSING_WEIGHT = C.RESULT_VAL

FROM
      CLINICAL_EVENT   C       ; Dosing Weight
    , PERSON           P
    , PERSON_ALIAS     PA
    , ENCOUNTER        E
    , ENCNTR_ALIAS     EA

PLAN C WHERE C.EVENT_CD = 14516898  ; Dosing Weight
    AND C.EVENT_END_DT_TM BETWEEN 
        cnvtdatetime("01 jan 2024 0000") ; Weight entered Start date
        AND 
        cnvtdatetime("31 Dec 2024 2359") ; Weight entered End Date

JOIN P WHERE C.PERSON_ID = P.PERSON_ID
    AND P.NAME_FULL_FORMATTED != "Zzztest,*"
    ;AND P.BIRTH_DT_TM BETWEEN 
    ;cnvtdatetime("01-DEC-2023 00:00:00") ; DOB Start date
    ;AND 
    ;cnvtdatetime("31-DEC-2024 23:59:59") ; DOB End date

JOIN PA WHERE PA.PERSON_ID = P.PERSON_ID
  AND PA.PERSON_ALIAS_TYPE_CD = 10.00
  AND PA.END_EFFECTIVE_DT_TM > SYSDATE
  AND PA.ALIAS_POOL_CD = 14504365  ; Rotunda
  ;AND PA.ALIAS IN ; Enter MRNs to check here
 ; (
  	;"MRN1",
  	;"MRN2",
  	;"MRN3" **remember to remove last comma from the final MRN
 ; )

JOIN E WHERE C.ENCNTR_ID = E.ENCNTR_ID

JOIN EA WHERE E.ENCNTR_ID = EA.ENCNTR_ID
    AND EA.ENCNTR_ALIAS_TYPE_CD = 1077.00 ; FIN

ORDER BY
    DOSING_WEIGHT_DT_TM

WITH MAXREC = 20000, NOCOUNTER, SEPARATOR=" ", FORMAT, TIME = 3000
