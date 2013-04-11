QuickSurvey API
---------------

Testing API root: http://quicksurvey.heroku.com/api
== Create new survey ==
/surveys/create.json?title=[survey title]
<pre>
return {
	status: [success/fail],
	data: {url: [url for survey listening]}
}
</pre>