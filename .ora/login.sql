--   login.sql
--   SQL*Plus user login startup file.
--
--   This script is automatically run after glogin.sql
--
-- To change the SQL*Plus prompt to display the current user,
-- connection identifier and current time.
-- SET the SQLPROMPT to include the _USER, _CONNECT_IDENTIFIER
-- and _DATE variables.
SET SQLPROMPT "_USER'@'_CONNECT_IDENTIFIER> "
DEFINE _EDITOR=vim
SET EDITFILE /tmp/$LOGNAME/afiedt.buf

-- To set the number of lines to display in a report page to 24.
SET PAGESIZE 10000

-- To set the number of characters to display on each report line to 78.
SET LINESIZE 190
