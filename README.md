# SQL_Challenge

###Overview of the analysis

The purpose of this analysis to oversee two things. 1) which employees retiring soon and what are their position titles? 2) Which employees eligible for the mentorship program based on their birth date? with these two questions, company can easily decide which positions are going to be open soon, so they can hire replcements. Also, create a group of people who can train or be a mentor to the fellow employees for the same positions. To do this, we have created a table called "retirement_titles" and included everyone that was born between 01/01/1952 and 12/31/1955. Same thing with the mentorship program table, we have created a table to include everyone that was born in 1965, and only included their latest title.

###Results

1) Table shows that we have over 25k senior engineers retiring soon, so we need to either give promotion to the current junior engineers or hire experienced senior-level engineers.![employee positions table](https://github.com/dilnigar1007/SQL_Challenge/blob/main/table%201.png) 2) Using the code "SELECT COUNT(*) FROM mentorship_eligibility;" we know that there is 1,549 unique employees under mentorship program. 3) In the mentorship table, we have duplicate employees with same from_date, to_date, but different position titles. Old position titles should have a different from_date and to_date than the latest title.

###Summary

1) SELECT sum(count) FROM retiring_titles; based on this query, we need 72,458 employees as soon as possible to make an impact because these are the number of people retiring soon. 2) Since we only have 1,549 employees in mentorship program, and we have more than 70k employees retiring and need the same number of people, we don't have enough employees to mentor the next generation.
