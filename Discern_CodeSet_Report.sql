/*
##################
Title:            Discern CodeSet Report
Summary           Retrieves the codesets within Discern - First load codeset identifier. Menu Bar > Tools > Code Search. E.g. Code value 4 = "Person Alias Type"
Date Created:     23/06/2025
Last Updated;     23/06/2025
Github link:      https://github.com/leoninformatics/Discern-Reporting/edit/main/Discern_CodeSet_Report
Email:            lohagan@rotunda.ie
##################
*/

SELECT 
	CV1.CODE_VALUE,
	CV1.DISPLAY,
	CV1.CDF_MEANING,
	CV1.DESCRIPTION,
	CV1.DISPLAY_KEY,
	CV1.CKI
FROM CODE_VALUE CV1 

WHERE CV1.CODE_SET =  1 AND CV1.ACTIVE_IND = 1 ; search code values as instructed and update the CV number here. Example of Code_Set 1 output below
WITH  FORMAT, TIME = 60

##################
Example output CV1.CODE_SET =  1
##################
    CODE_VALUE	DISPLAY			CDF_MEANING	DESCRIPTION		DISPLAY_KEY		CKI	
    9076227.00	Assault					Assault			ASSAULT			CKI.CODEVALUE!23741	
    9076229.00	Deliberate self-harm			Domestic		DELIBERATESELFHARM	CKI.CODEVALUE!23742	
    9076231.00	Firework injury				Fire/Explosion		FIREWORKINJURY		CKI.CODEVALUE!36334	
    9076233.00	Brought in dead				Brought in dead		BROUGHTINDEAD		CKI.CODEVALUE!23744	
    9076237.00	Other accident				Other			OTHERACCIDENT		CKI.CODEVALUE!23747	
    9076239.00	Sports injury				Sport/Recreation	SPORTSINJURY		CKI.CODEVALUE!23748	
    9076241.00	Other than above			Unknown			OTHERTHANABOVE		CKI.CODEVALUE!23749	
    9076243.00	Not Known				Not Known		NOTKNOWN		
    9076245.00	Major Incident				Major Incident		MAJORINCIDENT		
    9076235.00	Road traffic collision			Motor Vehicle (MVA)	ROADTRAFFICCOLLISION	CKI.CODEVALUE!23746	
##################
